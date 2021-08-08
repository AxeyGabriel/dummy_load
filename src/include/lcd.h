/*-
 * LCD basics
 * Target device: STM8S103
 * Written by Axey Gabriel Muller Endres
 * November 15, 2019
 */

#ifndef __LCD_H__
#define __LCD_H__

void lcd_cmd(uint8_t cmd);
void lcd_data(uint8_t cmd);
void lcd_init(void);
void lcd_clear(void);
void lcd_puts(const uint8_t *c);
void lcd_goto(uint8_t x, uint8_t y);

#endif
