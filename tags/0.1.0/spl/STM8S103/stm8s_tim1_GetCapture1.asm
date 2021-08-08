;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_GetCapture1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_GetCapture1
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
;	./src/stm8s_tim1_GetCapture1.c: 47: uint16_t TIM1_GetCapture1(void)
;	-----------------------------------------
;	 function TIM1_GetCapture1
;	-----------------------------------------
_TIM1_GetCapture1:
	pushw	x
;	./src/stm8s_tim1_GetCapture1.c: 54: tmpccr1h = TIM1->CCR1H;
	ld	a, 0x5265
	ld	xh, a
;	./src/stm8s_tim1_GetCapture1.c: 55: tmpccr1l = TIM1->CCR1L;
	ld	a, 0x5266
;	./src/stm8s_tim1_GetCapture1.c: 57: tmpccr1 = (uint16_t)(tmpccr1l);
	ld	xl, a
	clr	a
;	./src/stm8s_tim1_GetCapture1.c: 58: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
	clrw	y
	clr	(0x02, sp)
	pushw	x
	or	a, (1, sp)
	popw	x
	rrwa	x
	or	a, (0x02, sp)
	ld	xl, a
;	./src/stm8s_tim1_GetCapture1.c: 60: return (uint16_t)tmpccr1;
;	./src/stm8s_tim1_GetCapture1.c: 61: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
