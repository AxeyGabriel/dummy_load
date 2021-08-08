;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_CCxCmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_CCxCmd
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
;	./src/stm8s_tim2_CCxCmd.c: 53: void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_CCxCmd
;	-----------------------------------------
_TIM2_CCxCmd:
;	./src/stm8s_tim2_CCxCmd.c: 59: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00114$
;	./src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	ld	a, 0x530a
;	./src/stm8s_tim2_CCxCmd.c: 62: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00102$
;	./src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	or	a, #0x01
	ld	0x530a, a
	ret
00102$:
;	./src/stm8s_tim2_CCxCmd.c: 68: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	and	a, #0xfe
	ld	0x530a, a
	ret
00114$:
;	./src/stm8s_tim2_CCxCmd.c: 72: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00111$
;	./src/stm8s_tim2_CCxCmd.c: 64: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	ld	a, 0x530a
;	./src/stm8s_tim2_CCxCmd.c: 75: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00105$
;	./src/stm8s_tim2_CCxCmd.c: 77: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
	or	a, #0x10
	ld	0x530a, a
	ret
00105$:
;	./src/stm8s_tim2_CCxCmd.c: 81: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	and	a, #0xef
	ld	0x530a, a
	ret
00111$:
;	./src/stm8s_tim2_CCxCmd.c: 89: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
	ld	a, 0x530b
;	./src/stm8s_tim2_CCxCmd.c: 87: if (NewState != DISABLE)
	tnz	(0x04, sp)
	jreq	00108$
;	./src/stm8s_tim2_CCxCmd.c: 89: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
	or	a, #0x01
	ld	0x530b, a
	ret
00108$:
;	./src/stm8s_tim2_CCxCmd.c: 93: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	and	a, #0xfe
	ld	0x530b, a
;	./src/stm8s_tim2_CCxCmd.c: 96: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
