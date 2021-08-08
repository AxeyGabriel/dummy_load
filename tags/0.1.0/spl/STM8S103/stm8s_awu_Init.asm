;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_awu_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AWU_Init
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
;	./src/stm8s_awu_Init.c: 50: void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
;	-----------------------------------------
;	 function AWU_Init
;	-----------------------------------------
_AWU_Init:
	push	a
;	./src/stm8s_awu_Init.c: 56: AWU->CSR |= AWU_CSR_AWUEN;
	bset	20720, #4
;	./src/stm8s_awu_Init.c: 59: AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
	ld	a, 0x50f2
	and	a, #0xf0
	ld	0x50f2, a
;	./src/stm8s_awu_Init.c: 60: AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
	ld	a, 0x50f2
	ld	(0x01, sp), a
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	addw	x, #(_TBR_Array + 0)
	ld	a, (x)
	or	a, (0x01, sp)
	ld	0x50f2, a
;	./src/stm8s_awu_Init.c: 63: AWU->APR &= (uint8_t)(~AWU_APR_APR);
	ld	a, 0x50f1
	and	a, #0xc0
	ld	0x50f1, a
;	./src/stm8s_awu_Init.c: 64: AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
	ld	a, 0x50f1
	ld	(0x01, sp), a
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	addw	x, #(_APR_Array + 0)
	ld	a, (x)
	or	a, (0x01, sp)
	ld	0x50f1, a
;	./src/stm8s_awu_Init.c: 65: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
