/*-
 * Timer4 Interrupt Service Routine
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 16, 2019
 */

#include <stdio.h>
#include "stm8s_it.h"
#include "temperature.h"
#include "adc_avg.h"
#include "display.h"

static uint16_t counter = 1;
static uint8_t counter2 = 0;

static uint8_t flags;
extern int16_t tim1_value;
extern uint8_t temperature;

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    /*
     * Timer4 Overflows every 2.048mS
     */

    if(!(counter % 3)) /* Every 3 overflows     */
    {
        get_adc_values(); 
    }

    if(!(counter % 49)) /* Every 49 overflows   */
    {
        /* Measure temperature */
        temperature = measure_temperature(raw_temperature_avg);
        
        /* Set fan speed based on temperature */
        set_fan_speed(temperature);

        /* On aprox. 80 Celcius set overtemperature flag */
        if(temperature >= 25)
        {
            flags |= (1 << 0); 
        }

        /* Check if overtemperature occured */
        if(flags & (1 << 0))
        {
            TIM1_SetCompare3(0);                  /* Disable mosfet */
            display_overtemperature(1);

            /* If temperature is now aprox. 60 Celcius */
            if(temperature <= 18) // 18
            {
                flags &= ~(1 << 0);                 /* Clear flag */
                GPIO_WriteLow(GPIOD, GPIO_PIN_4);   /* Stop beeping */
                TIM1_SetCompare3(tim1_value);       /* Restore PWM DAC value */
                display_overtemperature(0);
            }
        }
    }

    if(!(counter % 200))
    {
        if(flags & (1 << 0))
        {
            GPIO_WriteReverse(GPIOD, GPIO_PIN_4); /* Beep           */
        }

        display_update();
    }
    
    counter++;
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE); 
}

