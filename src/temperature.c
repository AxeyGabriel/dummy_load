#include "stm8s.h"

/*-
 * Temperature things
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 16, 2019
 */

/*
 * Table for 65 reading points,
 * with each point being 3 celcius
 *
 * To use with a 10K NTC with a 10K
 * pull-down resistor and a 10 bit ADC
 * Beta = 3480
 *
 * Range from 5 to 110 degrees celcius
 *
 */
static const int8_t ntc_table[65] = {
    -20, -17, -14, -12, -10, -9, -8, -7, -6, 
    -5, -4, -3, -3, -2, -1, -1, 0, 0, 1, 2, 2, 
    3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 
    10, 11, 11, 12, 12, 13, 14, 14, 15, 16, 16, 
    17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 
    30, 32, 35, 39, 43, 50, 64, 78
};


/*
 * Fan curve table
 *
 */
static const uint8_t fan_curve[65] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 35,
    40, 45, 50, 70, 100, 120, 150, 150, 180, 200, 230,
    255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
    255, 255, 255, 255, 255, 255, 255, 255, 255, 255
};

/*
 * Measure temperature
 * Temperature in Celcius is
 * 5 + (return value * 3)
 */
uint8_t measure_temperature(uint16_t adc)
{
        int8_t p1;
        int8_t p2;

        p1 = ntc_table[adc >> 4];
        p2 = ntc_table[(adc >> 4) + 1];

        return p1 + ((p2 - p1) * (adc & 0x000F)) / 16;
}

void set_fan_speed(uint8_t temp)
{
    uint8_t speed = fan_curve[temp];
    TIM2_SetCompare1(speed); 
}
