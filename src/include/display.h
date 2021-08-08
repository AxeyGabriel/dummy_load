/*-
 * Display menu logic
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 17, 2019
 */

#ifndef __DISPLAY_H__
#define __DISPLAY_H__

void display_start(void);
void display_update(void);
void display_overtemperature(uint8_t yes);
void encoder_left(void);
void encoder_right(void);
void encoder_button_long(void);
void encoder_button_short(void);

#endif
