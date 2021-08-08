;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_OC3PreloadConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_OC3PreloadConfig
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
;	./src/stm8s_tim1_OC3PreloadConfig.c: 48: void TIM1_OC3PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC3PreloadConfig
;	-----------------------------------------
_TIM1_OC3PreloadConfig:
;	./src/stm8s_tim1_OC3PreloadConfig.c: 56: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
	ld	a, 0x525a
;	./src/stm8s_tim1_OC3PreloadConfig.c: 54: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_tim1_OC3PreloadConfig.c: 56: TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x525a, a
	ret
00102$:
;	./src/stm8s_tim1_OC3PreloadConfig.c: 60: TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x525a, a
;	./src/stm8s_tim1_OC3PreloadConfig.c: 62: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)