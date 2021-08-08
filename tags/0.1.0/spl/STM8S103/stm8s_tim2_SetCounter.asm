;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_SetCounter
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_SetCounter
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
;	./src/stm8s_tim2_SetCounter.c: 48: void TIM2_SetCounter(uint16_t Counter)
;	-----------------------------------------
;	 function TIM2_SetCounter
;	-----------------------------------------
_TIM2_SetCounter:
	pushw	x
;	./src/stm8s_tim2_SetCounter.c: 51: TIM2->CNTRH = (uint8_t)(Counter >> 8);
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ld	a, (0x02, sp)
	ld	0x530c, a
;	./src/stm8s_tim2_SetCounter.c: 52: TIM2->CNTRL = (uint8_t)(Counter);
	ld	a, (0x06, sp)
	ld	0x530d, a
;	./src/stm8s_tim2_SetCounter.c: 53: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
