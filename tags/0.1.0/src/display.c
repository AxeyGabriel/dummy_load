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

/*
 * State machine
 * 1: CURRENT: 0.000A
 *    VOLTAGE: 0.000V
 *
 * 255: OVERTEMPERATURE
 *      FAIL.      xxxC
 *
 */
static uint8_t state_machine;
static uint8_t state_changed;
static uint8_t old_state;
static uint8_t locked;

static uint8_t was_hot;

extern uint8_t temperature;
extern uint16_t tim1_value;

static uint8_t step = 1;

void display_start(void)
{
    state_machine = 1;
    old_state = 0;
    was_hot = 0;
    state_changed = 1;
    locked = 0;
}

void display_overtemperature(uint8_t yes)
{           
    if(yes == 0)
    {
        state_machine = 1;
        state_changed = 1;
        was_hot = 0;
        locked = 0;
    }
    else
    {
        if(was_hot == 0)
        {
            state_changed = 1;
        }

        was_hot = 1;
        old_state = state_machine;
        state_machine = 255;
        locked = 1;
    }

}

void display_update(void)
{
    uint8_t buffer[10];

    switch(state_machine)
    {
        case 1:
            if(state_changed == 1)
            {
                state_changed = 0;
                lcd_clear();
                lcd_puts("CURRENT: ");
                lcd_goto(0, 1);
                lcd_puts("VOLTAGE: ");
                
            }
            
            lcd_goto(9, 0);
            sprintf(buffer, "%2u.%02u", (uint16_t) miliamps_avg / 1000, (uint16_t) (miliamps_avg % 1000) / 10);
            lcd_puts(buffer);
            lcd_goto(9, 1);
            sprintf(buffer, "%2u.%02u", (uint16_t) milivolts_avg / 1000, (uint16_t) (milivolts_avg % 1000) / 10);
            lcd_puts(buffer);
            break;

        case 255:
            if(state_changed == 1)
            {
                state_changed = 0;
                lcd_clear();
                lcd_puts("OVERTEMPERATURE");
                lcd_goto(0, 1);
                lcd_puts("FAIL.");
            }
            
            lcd_goto(11, 1);
            sprintf(buffer, "%03u%cC", (5 + (temperature * 3)), 0xDF);
            lcd_puts(buffer);
            break;

        default:
            break;
    }
}

void encoder_left(void)
{
    if(locked == 1)
        return;

    if(state_machine == 1)
    {

        if(tim1_value > 0)
            tim1_value -= 1 + step;

        TIM1_SetCompare3(tim1_value);
    }
}

void encoder_right(void)
{
    if(locked == 1)
        return;

    if(state_machine == 1)
    {
        if(tim1_value < 4095)
            tim1_value += 1 + step;

        TIM1_SetCompare3(tim1_value);
    }

}

void encoder_button_short(void)
{
    step -= 5;
}

void encoder_button_long(void)
{
    step += 5;
}