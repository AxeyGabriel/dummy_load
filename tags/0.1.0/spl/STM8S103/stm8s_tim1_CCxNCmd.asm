;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_CCxNCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_CCxNCmd
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
;	./src/stm8s_tim1_CCxNCmd.c: 53: void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxNCmd
;	-----------------------------------------
_TIM1_CCxNCmd:
;	./src/stm8s_tim1_CCxNCmd.c: 59: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00114$
;	./src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	./src/stm8s_tim1_CCxNCmd.c: 62: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	or	a, #0x04
	ld	0x525c, a
	ret
00102$:
;	./src/stm8s_tim1_CCxNCmd.c: 68: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
	and	a, #0xfb
	ld	0x525c, a
	ret
00114$:
;	./src/stm8s_tim1_CCxNCmd.c: 71: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00111$
;	./src/stm8s_tim1_CCxNCmd.c: 64: TIM1->CCER1 |= TIM1_CCER1_CC1NE;
	ld	a, 0x525c
;	./src/stm8s_tim1_CCxNCmd.c: 74: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	./src/stm8s_tim1_CCxNCmd.c: 76: TIM1->CCER1 |= TIM1_CCER1_CC2NE;
	or	a, #0x40
	ld	0x525c, a
	ret
00105$:
;	./src/stm8s_tim1_CCxNCmd.c: 80: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
	and	a, #0xbf
	ld	0x525c, a
	ret
00111$:
;	./src/stm8s_tim1_CCxNCmd.c: 88: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	ld	a, 0x525d
;	./src/stm8s_tim1_CCxNCmd.c: 86: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	./src/stm8s_tim1_CCxNCmd.c: 88: TIM1->CCER2 |= TIM1_CCER2_CC3NE;
	or	a, #0x04
	ld	0x525d, a
	ret
00108$:
;	./src/stm8s_tim1_CCxNCmd.c: 92: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
	and	a, #0xfb
	ld	0x525d, a
;	./src/stm8s_tim1_CCxNCmd.c: 95: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
