;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_CCxCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_CCxCmd
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
;	./src/stm8s_tim1_CCxCmd.c: 54: void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_CCxCmd
;	-----------------------------------------
_TIM1_CCxCmd:
;	./src/stm8s_tim1_CCxCmd.c: 60: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00120$
;	./src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	./src/stm8s_tim1_CCxCmd.c: 63: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	or	a, #0x01
	ld	0x525c, a
	ret
00102$:
;	./src/stm8s_tim1_CCxCmd.c: 69: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
	and	a, #0xfe
	ld	0x525c, a
	ret
00120$:
;	./src/stm8s_tim1_CCxCmd.c: 73: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00117$
;	./src/stm8s_tim1_CCxCmd.c: 65: TIM1->CCER1 |= TIM1_CCER1_CC1E;
	ld	a, 0x525c
;	./src/stm8s_tim1_CCxCmd.c: 76: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	./src/stm8s_tim1_CCxCmd.c: 78: TIM1->CCER1 |= TIM1_CCER1_CC2E;
	or	a, #0x10
	ld	0x525c, a
	ret
00105$:
;	./src/stm8s_tim1_CCxCmd.c: 82: TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
	and	a, #0xef
	ld	0x525c, a
	ret
00117$:
;	./src/stm8s_tim1_CCxCmd.c: 90: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	ld	a, 0x525d
;	./src/stm8s_tim1_CCxCmd.c: 85: else if (TIM1_Channel == TIM1_CHANNEL_3)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x02
	pop	a
	jrne	00114$
;	./src/stm8s_tim1_CCxCmd.c: 88: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	./src/stm8s_tim1_CCxCmd.c: 90: TIM1->CCER2 |= TIM1_CCER2_CC3E;
	or	a, #0x01
	ld	0x525d, a
	ret
00108$:
;	./src/stm8s_tim1_CCxCmd.c: 94: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
	and	a, #0xfe
	ld	0x525d, a
	ret
00114$:
;	./src/stm8s_tim1_CCxCmd.c: 100: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00111$
;	./src/stm8s_tim1_CCxCmd.c: 102: TIM1->CCER2 |= TIM1_CCER2_CC4E;
	or	a, #0x10
	ld	0x525d, a
	ret
00111$:
;	./src/stm8s_tim1_CCxCmd.c: 106: TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
	and	a, #0xef
	ld	0x525d, a
;	./src/stm8s_tim1_CCxCmd.c: 109: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
