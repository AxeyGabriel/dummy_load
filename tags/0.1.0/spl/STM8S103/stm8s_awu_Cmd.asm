;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_awu_Cmd
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AWU_Cmd
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
;	./src/stm8s_awu_Cmd.c: 49: void AWU_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function AWU_Cmd
;	-----------------------------------------
_AWU_Cmd:
;	./src/stm8s_awu_Cmd.c: 54: AWU->CSR |= AWU_CSR_AWUEN;
	ld	a, 0x50f0
;	./src/stm8s_awu_Cmd.c: 51: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_awu_Cmd.c: 54: AWU->CSR |= AWU_CSR_AWUEN;
	or	a, #0x10
	ld	0x50f0, a
	ret
00102$:
;	./src/stm8s_awu_Cmd.c: 59: AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
	and	a, #0xef
	ld	0x50f0, a
;	./src/stm8s_awu_Cmd.c: 61: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
