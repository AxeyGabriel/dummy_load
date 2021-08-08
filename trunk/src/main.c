/*-
 * Dummy load firmware
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 14, 2019
 */

#include <stdio.h>

#include "stm8s.h"
#include "stm8s_it.h"
#include "isr_timer4.h"
#include "delay.h"
#include "lcd.h"
#include "display.h"

uint8_t temperature = 0;
uint16_t tim1_value = 0;

uint8_t read_rotary(void);

#define ROTARY_CW   255
#define ROTARY_CCW  1

void main(void)
{
    /* 
     * Wait for power to stabilize
     *
     */
    _delay_ms(30);

    CLK_DeInit();
    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(DISABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);

    GPIO_DeInit(GPIOA);
    GPIO_DeInit(GPIOB);
    GPIO_DeInit(GPIOC);
    GPIO_DeInit(GPIOD);
    
    GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);        /* ENCODER 1 */
    GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);        /* ENCODER 2 */
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);    /* SPARE     */
  
    GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD_D4    */
    GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD_D5    */
    
    GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);    /* VADJ PWM             */
    GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);        /* HEATSINK TEMP AIN2   */
    GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);    /* FAN PWM              */
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD_D6               */
    GPIO_Init(GPIOC, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD_D7               */
   

    GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD CS               */
    GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);        /* OUTPUT CURR.  AIN3   */
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);        /* INPUT VOLTAGE AIN4   */
    GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);    /* Beeper               */
    GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);    /* LCD RS               */
    GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);        /* Button               */

    /* Fan PWM configuration */
    TIM2_DeInit();
    TIM2_TimeBaseInit(TIM2_PRESCALER_32, 255);
    TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 255, TIM2_OCPOLARITY_LOW);
    TIM2_Cmd(ENABLE);

    /* ISET PWM-DAC configuration */
    TIM1_DeInit();
    TIM1_PrescalerConfig(0, TIM1_PSCRELOADMODE_IMMEDIATE);
    TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 4095, 0);
    TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE,
        TIM1_OUTPUTNSTATE_DISABLE, (uint16_t) 2047, TIM1_OCPOLARITY_HIGH,
        TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET,
        TIM1_OCNIDLESTATE_RESET);
    TIM1_Cmd(ENABLE);
    TIM1_CtrlPWMOutputs(ENABLE);
    
    /* Tasks Timer */
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 255);
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    TIM4_Cmd(ENABLE);

    /* ADC configuration */
    ADC1_DeInit();
    ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D4,
        ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2,
        DISABLE);
    ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D6,
        ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,
        DISABLE);
    ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D4,
        ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4,
        DISABLE);
    ADC1_DataBufferCmd(DISABLE);
    ADC1_ITConfig(ADC1_IT_EOCIE, DISABLE);
    ADC1_ScanModeCmd(DISABLE);
    ADC1_Cmd(ENABLE);

    /* Initialize with stopped fan and zero current draw */
    TIM2_SetCompare1(0);
    TIM1_SetCompare3(0);

    /* Splash screen */
    lcd_init();
    lcd_puts("Dummy Load, 2019");
    lcd_goto(0, 1);
    lcd_puts("By Axey Gabriel");
    _delay_ms(1500);
   
    enableInterrupts();
    
    display_start();

    while(1)
    {
        static uint8_t rotary_rotation;
        rotary_rotation = read_rotary();

        if(rotary_rotation == ROTARY_CW)
        {
            encoder_right();
        }
        else if(rotary_rotation == ROTARY_CCW)
        {
            encoder_left();
        }

        if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_6))
        {
            _delay_ms(1000);
            if(GPIO_ReadInputPin(GPIOD, GPIO_PIN_6))
            {
                /* Encoder button less than 1 second short pressed */
                encoder_button_short();
            }
            else
            {
                while(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_6));
                /* Encoder button 1 second long pressed */
                encoder_button_long();
            }
        }
    }
}


/*
 * Taken from https://www.best-microcontroller-projects.com/rotary-encoder.html
 * 04 March 2020
 */
uint8_t read_rotary(void)
{
    static const uint8_t rot_enc_table[] = {0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0};
    static uint8_t prevNextCode = 0;
    static uint16_t store = 0;

    prevNextCode <<= 2;

    if(!GPIO_ReadInputPin(GPIOA, GPIO_PIN_1))
        prevNextCode |= 0x02;


    if(!GPIO_ReadInputPin(GPIOA, GPIO_PIN_2))
        prevNextCode |= 0x01;

    prevNextCode &= 0x0F;

    if(rot_enc_table[prevNextCode])
    {
        store <<= 4;
        store |= prevNextCode;

        if((store & 0xFF) == 0x2b)
            return ROTARY_CW;

        if((store & 0xFF) == 0x17)
            return ROTARY_CCW;
    }

    return 0;
}

/* vim: set expandtab: ts=4 */

/*
 * EOF
 */
