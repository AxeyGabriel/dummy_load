;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_GetBufferValue
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_GetBufferValue
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./src/stm8s_adc1_GetBufferValue.c: 48: uint16_t ADC1_GetBufferValue(uint8_t Buffer)
;	-----------------------------------------
;	 function ADC1_GetBufferValue
;	-----------------------------------------
_ADC1_GetBufferValue:
	sub	sp, #4
;	./src/stm8s_adc1_GetBufferValue.c: 56: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	ld	a, 0x5402
	ld	(0x04, sp), a
;	./src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (0x07, sp)
	sll	a
	clrw	x
	ld	xl, a
	exgw	x, y
	ldw	x, y
	addw	x, #0x53e1
;	./src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	addw	y, #0x53e0
;	./src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	./src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
;	./src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
	ld	a, (x)
	ld	xl, a
;	./src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
	ld	a, (y)
;	./src/stm8s_adc1_GetBufferValue.c: 56: if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
	push	a
	ld	a, (0x05, sp)
	bcp	a, #0x08
	pop	a
	jreq	00102$
;	./src/stm8s_adc1_GetBufferValue.c: 59: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	./src/stm8s_adc1_GetBufferValue.c: 61: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
;	./src/stm8s_adc1_GetBufferValue.c: 63: temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
	clr	(0x02, sp)
	exg	a, xl
	ld	(0x04, sp), a
	exg	a, xl
	clr	(0x03, sp)
	or	a, (0x03, sp)
	ld	xh, a
	ld	a, (0x04, sp)
	or	a, (0x02, sp)
	ld	xl, a
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	./src/stm8s_adc1_GetBufferValue.c: 68: temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
;	./src/stm8s_adc1_GetBufferValue.c: 70: templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
;	./src/stm8s_adc1_GetBufferValue.c: 72: temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
	rlwa	x
	clr	a
	rrwa	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x01, sp), x
	ld	xl, a
	ld	a, (0x02, sp)
	ld	(0x04, sp), a
	ld	a, xl
	or	a, (0x01, sp)
	ld	(0x03, sp), a
00103$:
;	./src/stm8s_adc1_GetBufferValue.c: 75: return ((uint16_t)temph);
	ldw	x, (0x03, sp)
;	./src/stm8s_adc1_GetBufferValue.c: 76: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
