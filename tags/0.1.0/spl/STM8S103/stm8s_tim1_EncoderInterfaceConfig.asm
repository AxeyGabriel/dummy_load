;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_EncoderInterfaceConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_EncoderInterfaceConfig
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
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 62: void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
;	-----------------------------------------
;	 function TIM1_EncoderInterfaceConfig
;	-----------------------------------------
_TIM1_EncoderInterfaceConfig:
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 72: if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	or	a, #0x02
	ld	0x525c, a
	jra	00103$
00102$:
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 78: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
	and	a, #0xfd
	ld	0x525c, a
00103$:
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 74: TIM1->CCER1 |= TIM1_CCER1_CC1P;
	ld	a, 0x525c
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 81: if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
	tnz	(0x05, sp)
	jreq	00105$
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 83: TIM1->CCER1 |= TIM1_CCER1_CC2P;
	or	a, #0x20
	ld	0x525c, a
	jra	00106$
00105$:
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 87: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
	and	a, #0xdf
	ld	0x525c, a
00106$:
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 90: TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
	ld	a, 0x5252
	and	a, #0xf0
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 91: | (uint8_t) TIM1_EncoderMode);
	or	a, (0x03, sp)
	ld	0x5252, a
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 94: TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
	ld	a, 0x5258
	and	a, #0xfc
	or	a, #0x01
	ld	0x5258, a
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 96: TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
	ld	a, 0x5259
	and	a, #0xfc
	or	a, #0x01
	ld	0x5259, a
;	./src/stm8s_tim1_EncoderInterfaceConfig.c: 98: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
