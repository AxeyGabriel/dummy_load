;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_OC3PolarityConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_OC3PolarityConfig
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
;	./src/stm8s_tim1_OC3PolarityConfig.c: 50: void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
;	-----------------------------------------
;	 function TIM1_OC3PolarityConfig
;	-----------------------------------------
_TIM1_OC3PolarityConfig:
;	./src/stm8s_tim1_OC3PolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC3P;
	ld	a, 0x525d
;	./src/stm8s_tim1_OC3PolarityConfig.c: 56: if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_tim1_OC3PolarityConfig.c: 58: TIM1->CCER2 |= TIM1_CCER2_CC3P;
	or	a, #0x02
	ld	0x525d, a
	ret
00102$:
;	./src/stm8s_tim1_OC3PolarityConfig.c: 62: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
	and	a, #0xfd
	ld	0x525d, a
;	./src/stm8s_tim1_OC3PolarityConfig.c: 64: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)