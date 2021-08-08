/*-
 * Get ADC values and average them
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 17, 2019
 */

#ifndef __ADC_AVG_H__
#define __ADC_AVG_H__

extern uint32_t miliamps_avg;
extern uint32_t milivolts_avg;
extern uint16_t raw_temperature_avg;

void get_adc_values(void);

#endif
