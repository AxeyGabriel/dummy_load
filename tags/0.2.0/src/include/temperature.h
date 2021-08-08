/*-
 * Temperature things
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 16, 2019
 */

#ifndef __TEMPERATURE_H__
#define __TEMPERATURE_H__

uint8_t measure_temperature(uint16_t adc);
void set_fan_speed(uint8_t temp);

#endif
