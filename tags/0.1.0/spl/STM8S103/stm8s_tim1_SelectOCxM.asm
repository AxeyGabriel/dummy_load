;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_SelectOCxM
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_SelectOCxM
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
;	./src/stm8s_tim1_SelectOCxM.c: 63: void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
;	-----------------------------------------
;	 function TIM1_SelectOCxM
;	-----------------------------------------
_TIM1_SelectOCxM:
;	./src/stm8s_tim1_SelectOCxM.c: 69: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00108$
;	./src/stm8s_tim1_SelectOCxM.c: 72: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	bres	21084, #0
;	./src/stm8s_tim1_SelectOCxM.c: 75: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x5258
	and	a, #0x8f
;	./src/stm8s_tim1_SelectOCxM.c: 76: | (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x5258, a
	ret
00108$:
;	./src/stm8s_tim1_SelectOCxM.c: 78: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00105$
;	./src/stm8s_tim1_SelectOCxM.c: 81: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	bres	21084, #4
;	./src/stm8s_tim1_SelectOCxM.c: 84: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
	ld	a, 0x5259
	and	a, #0x8f
;	./src/stm8s_tim1_SelectOCxM.c: 85: | (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x5259, a
	ret
00105$:
;	./src/stm8s_tim1_SelectOCxM.c: 90: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	ld	a, 0x525d
;	./src/stm8s_tim1_SelectOCxM.c: 87: else if (TIM1_Channel == TIM1_CHANNEL_3)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x02
	pop	a
	jrne	00102$
;	./src/stm8s_tim1_SelectOCxM.c: 90: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	and	a, #0xfe
	ld	0x525d, a
;	./src/stm8s_tim1_SelectOCxM.c: 93: TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525a
	and	a, #0x8f
;	./src/stm8s_tim1_SelectOCxM.c: 94: | (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x525a, a
	ret
00102$:
;	./src/stm8s_tim1_SelectOCxM.c: 99: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	and	a, #0xef
	ld	0x525d, a
;	./src/stm8s_tim1_SelectOCxM.c: 102: TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
	ld	a, 0x525b
	and	a, #0x8f
;	./src/stm8s_tim1_SelectOCxM.c: 103: | (uint8_t)TIM1_OCMode);
	or	a, (0x04, sp)
	ld	0x525b, a
;	./src/stm8s_tim1_SelectOCxM.c: 105: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
