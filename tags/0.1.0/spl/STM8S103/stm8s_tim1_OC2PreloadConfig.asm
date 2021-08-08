;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_OC2PreloadConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_OC2PreloadConfig
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
;	./src/stm8s_tim1_OC2PreloadConfig.c: 48: void TIM1_OC2PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_OC2PreloadConfig
;	-----------------------------------------
_TIM1_OC2PreloadConfig:
;	./src/stm8s_tim1_OC2PreloadConfig.c: 56: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
	ld	a, 0x5259
;	./src/stm8s_tim1_OC2PreloadConfig.c: 54: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_tim1_OC2PreloadConfig.c: 56: TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
	or	a, #0x08
	ld	0x5259, a
	ret
00102$:
;	./src/stm8s_tim1_OC2PreloadConfig.c: 60: TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
	and	a, #0xf7
	ld	0x5259, a
;	./src/stm8s_tim1_OC2PreloadConfig.c: 62: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)