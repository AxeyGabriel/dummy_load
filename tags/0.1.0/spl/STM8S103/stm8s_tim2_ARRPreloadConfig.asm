;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_ARRPreloadConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_ARRPreloadConfig
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
;	./src/stm8s_tim2_ARRPreloadConfig.c: 48: void TIM2_ARRPreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_ARRPreloadConfig
;	-----------------------------------------
_TIM2_ARRPreloadConfig:
;	./src/stm8s_tim2_ARRPreloadConfig.c: 56: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
	ld	a, 0x5300
;	./src/stm8s_tim2_ARRPreloadConfig.c: 54: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_tim2_ARRPreloadConfig.c: 56: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
	or	a, #0x80
	ld	0x5300, a
	ret
00102$:
;	./src/stm8s_tim2_ARRPreloadConfig.c: 60: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
	and	a, #0x7f
	ld	0x5300, a
;	./src/stm8s_tim2_ARRPreloadConfig.c: 62: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
