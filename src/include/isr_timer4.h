/*-
 * Timer4 Interrupt Service Routine
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 16, 2019
 */

#ifndef __ISR_TIMER4_H__
#define __ISR_TIMER4_H__

#include "stm8s.h"
 
void TIM4_UPD_OVF_IRQHandler(void) INTERRUPT(23);      /* TIM4 UPD/OVF */

#endif
