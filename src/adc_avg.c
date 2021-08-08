/*-
 * Get ADC values and average them
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 17, 2019
 */

#include "stm8s.h"
#include "adc_avg.h"

uint32_t miliamps_avg = 0;
uint32_t milivolts_avg = 0;
uint16_t raw_temperature_avg = 0;

static uint16_t last_temperature_readings[16] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

static uint16_t last_voltage_readings[16] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

static uint16_t last_current_readings[16] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

static uint8_t avg_counter = 0;


void get_adc_values(void)
{
        uint16_t raw_current_avg;
        uint16_t raw_voltage_avg;

        ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_2, ADC1_ALIGN_RIGHT);
        ADC1_StartConversion();
        while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
        ADC1_ClearFlag(ADC1_FLAG_EOC);
        last_temperature_readings[avg_counter] = ADC1_GetConversionValue();
        
        raw_temperature_avg = (last_temperature_readings[0]
            + last_temperature_readings[1]
            + last_temperature_readings[2]
            + last_temperature_readings[3]
            + last_temperature_readings[4]
            + last_temperature_readings[5]
            + last_temperature_readings[6]
            + last_temperature_readings[7]
            + last_temperature_readings[8]
            + last_temperature_readings[9]
            + last_temperature_readings[10]
            + last_temperature_readings[11]
            + last_temperature_readings[12]
            + last_temperature_readings[13]
            + last_temperature_readings[14]
            + last_temperature_readings[15]) / 16;
        
        ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_ALIGN_RIGHT);
        ADC1_StartConversion();
        while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
        ADC1_ClearFlag(ADC1_FLAG_EOC);
        last_current_readings[avg_counter] = ADC1_GetConversionValue();

        raw_current_avg = (last_current_readings[0]
            + last_current_readings[1]
            + last_current_readings[2]
            + last_current_readings[3]
            + last_current_readings[4]
            + last_current_readings[5]
            + last_current_readings[6]
            + last_current_readings[7]
            + last_current_readings[8]
            + last_current_readings[9]
            + last_current_readings[10]
            + last_current_readings[11]
            + last_current_readings[12]
            + last_current_readings[13]
            + last_current_readings[14]
            + last_current_readings[15]) / 16;

        miliamps_avg = (uint32_t) raw_current_avg * 5000;
        miliamps_avg /= (uint32_t) 1024;
        miliamps_avg *= (uint32_t) 2;
         
        ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_4, ADC1_ALIGN_RIGHT);
        ADC1_StartConversion();
        while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
        ADC1_ClearFlag(ADC1_FLAG_EOC);
        last_voltage_readings[avg_counter] = ADC1_GetConversionValue();
        
        raw_voltage_avg = (last_voltage_readings[0]
            + last_voltage_readings[1]
            + last_voltage_readings[2]
            + last_voltage_readings[3]
            + last_voltage_readings[4]
            + last_voltage_readings[5]
            + last_voltage_readings[6]
            + last_voltage_readings[7]
            + last_voltage_readings[8]
            + last_voltage_readings[9]
            + last_voltage_readings[10]
            + last_voltage_readings[11]
            + last_voltage_readings[12]
            + last_voltage_readings[13]
            + last_voltage_readings[14]
            + last_voltage_readings[15]) / 16;
        
        milivolts_avg = (uint32_t) raw_voltage_avg * 5000;
        milivolts_avg /= (uint32_t) 1024;
        milivolts_avg *= (uint32_t) 11;
        
        avg_counter += 1;
        if(avg_counter == 16)
        {
            avg_counter = 0;
        }
}
