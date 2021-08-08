;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_GetCapture2
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_GetCapture2
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
;	./src/stm8s_tim1_GetCapture2.c: 47: uint16_t TIM1_GetCapture2(void)
;	-----------------------------------------
;	 function TIM1_GetCapture2
;	-----------------------------------------
_TIM1_GetCapture2:
	pushw	x
;	./src/stm8s_tim1_GetCapture2.c: 54: tmpccr2h = TIM1->CCR2H;
	ld	a, 0x5267
	ld	xh, a
;	./src/stm8s_tim1_GetCapture2.c: 55: tmpccr2l = TIM1->CCR2L;
	ld	a, 0x5268
;	./src/stm8s_tim1_GetCapture2.c: 57: tmpccr2 = (uint16_t)(tmpccr2l);
	ld	xl, a
	clr	a
;	./src/stm8s_tim1_GetCapture2.c: 58: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
	clrw	y
	clr	(0x02, sp)
	pushw	x
	or	a, (1, sp)
	popw	x
	rrwa	x
	or	a, (0x02, sp)
	ld	xl, a
;	./src/stm8s_tim1_GetCapture2.c: 60: return (uint16_t)tmpccr2;
;	./src/stm8s_tim1_GetCapture2.c: 61: }
	addw	sp, #2
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
