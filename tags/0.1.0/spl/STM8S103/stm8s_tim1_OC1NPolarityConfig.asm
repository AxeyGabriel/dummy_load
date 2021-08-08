;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_OC1NPolarityConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_OC1NPolarityConfig
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
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 50: void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
;	-----------------------------------------
;	 function TIM1_OC1NPolarityConfig
;	-----------------------------------------
_TIM1_OC1NPolarityConfig:
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 58: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
	ld	a, 0x525c
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 56: if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 58: TIM1->CCER1 |= TIM1_CCER1_CC1NP;
	or	a, #0x08
	ld	0x525c, a
	ret
00102$:
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 62: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
	and	a, #0xf7
	ld	0x525c, a
;	./src/stm8s_tim1_OC1NPolarityConfig.c: 64: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)