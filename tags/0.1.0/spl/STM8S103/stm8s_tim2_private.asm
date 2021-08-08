;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_private
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TI1_Config
	.globl _TIM2_TI2_Config
	.globl _TIM2_TI3_Config
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
;	./src/stm8s_tim2_private.c: 58: void TIM2_TI1_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TIM2_TI1_Config
;	-----------------------------------------
_TIM2_TI1_Config:
	push	a
;	./src/stm8s_tim2_private.c: 63: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	bres	21258, #0
;	./src/stm8s_tim2_private.c: 66: TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
	ld	a, 0x5307
	and	a, #0x0c
	ld	(0x01, sp), a
;	./src/stm8s_tim2_private.c: 67: | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5307, a
;	./src/stm8s_tim2_private.c: 63: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	ld	a, 0x530a
;	./src/stm8s_tim2_private.c: 70: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim2_private.c: 72: TIM2->CCER1 |= TIM2_CCER1_CC1P;
	or	a, #0x02
	ld	0x530a, a
	jra	00103$
00102$:
;	./src/stm8s_tim2_private.c: 76: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
	and	a, #0xfd
	ld	0x530a, a
00103$:
;	./src/stm8s_tim2_private.c: 79: TIM2->CCER1 |= TIM2_CCER1_CC1E;
	bset	21258, #0
;	./src/stm8s_tim2_private.c: 80: }
	pop	a
	ret
;	./src/stm8s_tim2_private.c: 98: void TIM2_TI2_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TIM2_TI2_Config
;	-----------------------------------------
_TIM2_TI2_Config:
	push	a
;	./src/stm8s_tim2_private.c: 103: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	bres	21258, #4
;	./src/stm8s_tim2_private.c: 106: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
	ld	a, 0x5308
	and	a, #0x0c
	ld	(0x01, sp), a
;	./src/stm8s_tim2_private.c: 107: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5308, a
;	./src/stm8s_tim2_private.c: 103: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	ld	a, 0x530a
;	./src/stm8s_tim2_private.c: 111: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim2_private.c: 113: TIM2->CCER1 |= TIM2_CCER1_CC2P;
	or	a, #0x20
	ld	0x530a, a
	jra	00103$
00102$:
;	./src/stm8s_tim2_private.c: 117: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
	and	a, #0xdf
	ld	0x530a, a
00103$:
;	./src/stm8s_tim2_private.c: 121: TIM2->CCER1 |= TIM2_CCER1_CC2E;
	bset	21258, #4
;	./src/stm8s_tim2_private.c: 122: }
	pop	a
	ret
;	./src/stm8s_tim2_private.c: 138: void TIM2_TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
;	-----------------------------------------
;	 function TIM2_TI3_Config
;	-----------------------------------------
_TIM2_TI3_Config:
	push	a
;	./src/stm8s_tim2_private.c: 142: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
	bres	21259, #0
;	./src/stm8s_tim2_private.c: 145: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
	ld	a, 0x5309
	and	a, #0x0c
	ld	(0x01, sp), a
;	./src/stm8s_tim2_private.c: 146: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	ld	a, (0x06, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5309, a
;	./src/stm8s_tim2_private.c: 142: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
	ld	a, 0x530b
;	./src/stm8s_tim2_private.c: 150: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim2_private.c: 152: TIM2->CCER2 |= TIM2_CCER2_CC3P;
	or	a, #0x02
	ld	0x530b, a
	jra	00103$
00102$:
;	./src/stm8s_tim2_private.c: 156: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
	and	a, #0xfd
	ld	0x530b, a
00103$:
;	./src/stm8s_tim2_private.c: 159: TIM2->CCER2 |= TIM2_CCER2_CC3E;
	bset	21259, #0
;	./src/stm8s_tim2_private.c: 160: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
