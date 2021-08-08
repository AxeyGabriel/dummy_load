;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_GetFlagStatus
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
;	./src/stm8s_tim1_GetFlagStatus.c: 60: FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_GetFlagStatus
;	-----------------------------------------
_TIM1_GetFlagStatus:
	sub	sp, #3
;	./src/stm8s_tim1_GetFlagStatus.c: 68: tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
	ld	a, 0x5255
	ld	(0x03, sp), a
	ld	a, (0x07, sp)
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_tim1_GetFlagStatus.c: 69: tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
	ld	a, (0x06, sp)
	ld	(0x03, sp), a
	clr	(0x02, sp)
;	./src/stm8s_tim1_GetFlagStatus.c: 71: if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
	ld	a, 0x5256
	and	a, (0x03, sp)
	or	a, (0x01, sp)
	jreq	00102$
;	./src/stm8s_tim1_GetFlagStatus.c: 73: bitstatus = SET;
	ld	a, #0x01
;	./src/stm8s_tim1_GetFlagStatus.c: 77: bitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	./src/stm8s_tim1_GetFlagStatus.c: 79: return (FlagStatus)(bitstatus);
;	./src/stm8s_tim1_GetFlagStatus.c: 80: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
