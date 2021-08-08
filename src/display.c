/*-
 * Display menu logic
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 17, 2019
 */

#include <stdio.h>
#include "stm8s.h"
#include "display.h"
#include "lcd.h"
#include "adc_avg.h"
#include "delay.h"

#define FLAG_STATE_CHANGED  0x80
#define FLAG_LOCKED         0x40
#define FLAG_WAS_HOT        0x20
#define FLAG_STOPPED        0x10

static uint8_t flags;
static uint8_t state_machine;
static uint8_t state_changed;
static uint8_t old_state;

extern uint8_t temperature;
extern uint16_t tim1_value;

static uint8_t step = 5;
static uint8_t temp = 1;

void display_start(void)
{
    flags = 0x00;
    flags |= FLAG_STATE_CHANGED;
    old_state = 1;
    state_machine = 1;
}

void display_changestate(uint8_t state)
{
    old_state = state_machine;
    state_machine = state;
    
    flags |= FLAG_STATE_CHANGED;
}

void display_overtemperature(uint8_t yes)
{           
    if(yes == 0)
    {
        state_machine = 1;
        flags |= FLAG_STATE_CHANGED;
        flags &= ~FLAG_WAS_HOT;
        flags &= ~FLAG_LOCKED;
    }
    else
    {
        if(!(flags & FLAG_WAS_HOT))
        {
            flags |= FLAG_STATE_CHANGED;
        }

        flags |= FLAG_WAS_HOT;
        old_state = state_machine;
        state_machine = 255;
        flags |= FLAG_LOCKED;
    }

}

void display_update(void)
{
    uint8_t buffer[9];

    switch(state_machine)
    {
        case 1:
            if(flags & FLAG_STATE_CHANGED)
            {
                flags &= ~FLAG_STATE_CHANGED;
                lcd_clear();
                lcd_puts("I:      T:");
                lcd_goto(0, 1);
                lcd_puts("V:      P:");
                
                if(flags & FLAG_STOPPED)
                {
                    lcd_goto(15, 0);
                    lcd_puts("S");
                }
                
            }
           
            uint16_t miliamps_avgl = (uint16_t) miliamps_avg / 1000;
            uint16_t miliamps_avgr = (uint16_t) (miliamps_avg % 1000) / 10;
            uint16_t milivolts_avgl = (uint16_t) milivolts_avg / 1000;
            uint16_t milivolts_avgr = (uint16_t) (milivolts_avg % 1000) / 10;
            uint16_t miliwatts_avgl = (uint16_t) milivolts_avg / 1000 * (uint16_t) miliamps_avg / 1000;
            //uint16_t miliwatts_avgr = (uint16_t) (milivolts_avg % 1000) / 10 * (uint16_t) (miliamps_avg % 1000) / 10;

            lcd_goto(2, 0);
            sprintf(buffer, "%02u.%02u", miliamps_avgl, miliamps_avgr);
            lcd_puts(buffer);
            lcd_goto(2, 1);
            sprintf(buffer, "%02u.%02u", milivolts_avgl, milivolts_avgr);
            lcd_puts(buffer);
            lcd_goto(10, 1);
            sprintf(buffer, "%03uW", miliwatts_avgl);
            lcd_puts(buffer);
            
            lcd_goto(10,0);
            sprintf(buffer, "%02u%cC", (5 + (temperature * 3)), 0xDF);
            lcd_puts(buffer);

            break;

        /*case 3:
            if(flags & FLAG_STATE_CHANGED)
            {
                flags &= ~FLAG_STATE_CHANGED;
                lcd_clear();
                lcd_puts(" START      STOP");
                if(flags & FLAG_STOPPED)
                    temp = 2;
                else
                    temp = 1;
            }
            
            if(temp == 1)
            {
                lcd_goto(0, 0);
                lcd_puts(">");
                lcd_goto(11, 0);
                lcd_puts(" ");
                lcd_goto(0, 1);
                lcd_puts(" ");
            }
            else if(temp == 2)
            {
                lcd_goto(0, 0);
                lcd_puts(" ");
                lcd_goto(11, 0);
                lcd_puts(">");
                lcd_goto(0, 1);
                lcd_puts(" ");

            }
            break;*/
            

        case 255:
            if(flags & FLAG_STATE_CHANGED)
            {
                flags &= ~FLAG_STATE_CHANGED;
                lcd_clear();
                lcd_puts("OVERTEMPERATURE");
                lcd_goto(0, 1);
                lcd_puts("FAIL.");
            }
            
            lcd_goto(11, 1);
            sprintf(buffer, "%02u%cC", (5 + (temperature * 3)), 0xDF);
            lcd_puts(buffer);
            break;

        default:
            break;
    }
}

void encoder_left(void)
{
    if(flags & FLAG_LOCKED)
        return;

    if(state_machine == 1)
    {

        if((tim1_value - step) > 0 && !(flags & FLAG_STOPPED))
        {
            tim1_value -= step;

            TIM1_SetCompare3(tim1_value);
        }
    }
}

void encoder_right(void)
{
    if(flags & FLAG_LOCKED)
        return;

    if(state_machine == 1)
    {
        if((tim1_value + step ) < 4095 && !(flags & FLAG_STOPPED))
        {
            tim1_value += step;

            TIM1_SetCompare3(tim1_value);
        }
    }

}

void encoder_button_short(void)
{
    if(flags & FLAG_LOCKED)
        return;

    if(state_machine == 1)
    {
        if(flags & FLAG_STOPPED)
        {
            flags &= ~FLAG_STOPPED;
            TIM1_SetCompare3(tim1_value);
            state_machine = old_state;
            flags |= FLAG_STATE_CHANGED;
        }
        else
        {
            flags |= FLAG_STOPPED;
            TIM1_SetCompare3(0);
            state_machine = old_state;
            flags |= FLAG_STATE_CHANGED;
        }
    }
}

void encoder_button_long(void)
{
    if(flags & FLAG_LOCKED)
        return;

    if(state_machine == 1)
    {
        if(step == 5)
        {
            step = 10;
        }
        else
        {
            step = 5;
        }
    }
}
