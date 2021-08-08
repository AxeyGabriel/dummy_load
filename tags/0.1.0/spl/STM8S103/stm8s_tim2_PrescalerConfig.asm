;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_PrescalerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_PrescalerConfig
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
;	./src/stm8s_tim2_PrescalerConfig.c: 70: void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
;	-----------------------------------------
;	 function TIM2_PrescalerConfig
;	-----------------------------------------
_TIM2_PrescalerConfig:
;	./src/stm8s_tim2_PrescalerConfig.c: 78: TIM2->PSCR = (uint8_t)Prescaler;
	ldw	x, #0x530e
	ld	a, (0x03, sp)
	ld	(x), a
;	./src/stm8s_tim2_PrescalerConfig.c: 81: TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
	ldw	x, #0x5306
	ld	a, (0x04, sp)
	ld	(x), a
;	./src/stm8s_tim2_PrescalerConfig.c: 82: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
