;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_SelectInputTrigger
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_SelectInputTrigger
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
;	./src/stm8s_tim1_SelectInputTrigger.c: 52: void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
;	-----------------------------------------
;	 function TIM1_SelectInputTrigger
;	-----------------------------------------
_TIM1_SelectInputTrigger:
;	./src/stm8s_tim1_SelectInputTrigger.c: 58: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
	ld	a, 0x5252
	and	a, #0x8f
	or	a, (0x03, sp)
	ld	0x5252, a
;	./src/stm8s_tim1_SelectInputTrigger.c: 59: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
