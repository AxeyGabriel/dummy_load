;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_SelectOCxM
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_SelectOCxM
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
;	./src/stm8s_tim2_SelectOCxM.c: 62: void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
;	-----------------------------------------
;	 function TIM2_SelectOCxM
;	-----------------------------------------
_TIM2_SelectOCxM:
;	./src/stm8s_tim2_SelectOCxM.c: 68: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00105$
;	./src/stm8s_tim2_SelectOCxM.c: 71: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	bres	21258, #0
;	./src/stm8s_tim2_SelectOCxM.c: 74: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5307
	and	a, #0x8f
;	./src/stm8s_tim2_SelectOCxM.c: 75: | (uint8_t)TIM2_OCMode);
	or	a, (0x04, sp)
	ld	0x5307, a
	ret
00105$:
;	./src/stm8s_tim2_SelectOCxM.c: 77: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00102$
;	./src/stm8s_tim2_SelectOCxM.c: 80: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	bres	21258, #4
;	./src/stm8s_tim2_SelectOCxM.c: 83: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5308
	and	a, #0x8f
;	./src/stm8s_tim2_SelectOCxM.c: 84: | (uint8_t)TIM2_OCMode);
	or	a, (0x04, sp)
	ld	0x5308, a
	ret
00102$:
;	./src/stm8s_tim2_SelectOCxM.c: 89: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	bres	21259, #0
;	./src/stm8s_tim2_SelectOCxM.c: 92: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
	ld	a, 0x5309
	and	a, #0x8f
;	./src/stm8s_tim2_SelectOCxM.c: 93: | (uint8_t)TIM2_OCMode);
	or	a, (0x04, sp)
	ld	0x5309, a
;	./src/stm8s_tim2_SelectOCxM.c: 95: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
