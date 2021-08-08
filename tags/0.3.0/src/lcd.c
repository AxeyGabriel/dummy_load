/*-
 * LCD basics
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 15, 2019
 */

#include "stm8s.h"
#include "delay.h"
#include "lcd.h"

void lcd_init(void)
{
    lcd_cmd(0x33);
    _delay_ms(5);
    lcd_cmd(0x32);
    _delay_ms(5);
    lcd_cmd(0x28);
    _delay_ms(5);
    lcd_cmd(0x0C);
    _delay_ms(5);
    lcd_cmd(0x01);
    _delay_ms(5);
    lcd_cmd(0x06);
    _delay_ms(5);
    lcd_cmd(0x80);
    _delay_ms(50);
}

void lcd_cmd(uint8_t cmd)
{
    GPIO_WriteLow(GPIOD, GPIO_PIN_5);      /* LCD RS */
    
    if(cmd & 0b10000000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_7); /* LCD D7 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_7);  /* LCD D7 */
    
    if(cmd & 0b01000000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_6); /* LCD D6 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_6);  /* LCD D6 */

    if(cmd & 0b00100000)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_5); /* LCD D5 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_5);  /* LCD D5 */

    if(cmd & 0b00010000)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_4); /* LCD D4 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_4);  /* LCD D4 */
    
    GPIO_WriteHigh(GPIOD, GPIO_PIN_1);
    _delay_ms(1);
    GPIO_WriteLow(GPIOD, GPIO_PIN_1);   
   
    if(cmd & 0b00001000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_7); /* LCD D7 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_7);  /* LCD D7 */
    
    if(cmd & 0b00000100)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_6); /* LCD D6 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_6);  /* LCD D6 */

    if(cmd & 0b00000010)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_5); /* LCD D5 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_5);  /* LCD D5 */

    if(cmd & 0b00000001)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_4); /* LCD D4 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_4);  /* LCD D4 */
    
    GPIO_WriteHigh(GPIOD, GPIO_PIN_1);
    _delay_ms(1);
    GPIO_WriteLow(GPIOD, GPIO_PIN_1);   
}


void lcd_data(uint8_t cmd)
{
    GPIO_WriteHigh(GPIOD, GPIO_PIN_5);      /* LCD RS */
    
    if(cmd & 0b10000000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_7); /* LCD D7 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_7);  /* LCD D7 */
    
    if(cmd & 0b01000000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_6); /* LCD D6 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_6);  /* LCD D6 */

    if(cmd & 0b00100000)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_5); /* LCD D5 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_5);  /* LCD D5 */

    if(cmd & 0b00010000)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_4); /* LCD D4 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_4);  /* LCD D4 */
    
    GPIO_WriteHigh(GPIOD, GPIO_PIN_1);
    _delay_us(300);
    GPIO_WriteLow(GPIOD, GPIO_PIN_1);   
   
    if(cmd & 0b00001000)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_7); /* LCD D7 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_7);  /* LCD D7 */
    
    if(cmd & 0b00000100)
        GPIO_WriteHigh(GPIOC, GPIO_PIN_6); /* LCD D6 */
    else
        GPIO_WriteLow(GPIOC, GPIO_PIN_6);  /* LCD D6 */

    if(cmd & 0b00000010)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_5); /* LCD D5 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_5);  /* LCD D5 */

    if(cmd & 0b00000001)
        GPIO_WriteHigh(GPIOB, GPIO_PIN_4); /* LCD D4 */
    else
        GPIO_WriteLow(GPIOB, GPIO_PIN_4);  /* LCD D4 */
    
    GPIO_WriteHigh(GPIOD, GPIO_PIN_1);
    _delay_us(300);
    GPIO_WriteLow(GPIOD, GPIO_PIN_1);   

}

void lcd_clear(void)
{
    lcd_cmd(0x01);
    lcd_cmd(0x02);
    _delay_ms(10);
}

void lcd_goto(uint8_t x, uint8_t y)
{
    lcd_cmd(0x80 + ((y == 0) ? 0x00 : 0x40) + (x & 0x0F));
}

void lcd_puts(const uint8_t *c)
{
    while(*c != '\0')
    {
        if(*c == '\t') /* TAB                   */
        {
            lcd_data(' ');
            lcd_data(' ');
        }
        //else if(*c == '\n') /* NEW LINE         */
        //{

        //}
        //else if(*c == '\r') /* CARRIAGE RETURN  */
        //{

        //}
        else
        {
            lcd_data(*c);
        }
        
        *c++;
    }
}
