;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_TimeBaseInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TimeBaseInit
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
;	./src/stm8s_tim1_TimeBaseInit.c: 50: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
;	-----------------------------------------
;	 function TIM1_TimeBaseInit
;	-----------------------------------------
_TIM1_TimeBaseInit:
	pushw	x
;	./src/stm8s_tim1_TimeBaseInit.c: 59: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
	ld	a, (0x08, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ld	a, (0x02, sp)
	ld	0x5262, a
;	./src/stm8s_tim1_TimeBaseInit.c: 60: TIM1->ARRL = (uint8_t)(TIM1_Period);
	ld	a, (0x09, sp)
	ld	0x5263, a
;	./src/stm8s_tim1_TimeBaseInit.c: 63: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ld	a, (0x02, sp)
	ld	0x5260, a
;	./src/stm8s_tim1_TimeBaseInit.c: 64: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
	ld	a, (0x06, sp)
	ld	0x5261, a
;	./src/stm8s_tim1_TimeBaseInit.c: 67: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
	ld	a, 0x5250
	and	a, #0x8f
;	./src/stm8s_tim1_TimeBaseInit.c: 68: | (uint8_t)(TIM1_CounterMode));
	or	a, (0x07, sp)
	ld	0x5250, a
;	./src/stm8s_tim1_TimeBaseInit.c: 71: TIM1->RCR = TIM1_RepetitionCounter;
	ldw	x, #0x5264
	ld	a, (0x0a, sp)
	ld	(x), a
;	./src/stm8s_tim1_TimeBaseInit.c: 72: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
