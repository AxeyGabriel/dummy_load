;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_clk_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_GetITStatus
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
;	./src/stm8s_clk_GetITStatus.c: 48: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_GetITStatus
;	-----------------------------------------
_CLK_GetITStatus:
;	./src/stm8s_clk_GetITStatus.c: 55: if (CLK_IT == CLK_IT_SWIF)
	ld	a, (0x03, sp)
	cp	a, #0x1c
	jrne	00108$
;	./src/stm8s_clk_GetITStatus.c: 58: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c5
	and	a, (0x03, sp)
;	./src/stm8s_clk_GetITStatus.c: 60: bitstatus = SET;
	sub	a, #0x0c
	jrne	00102$
	inc	a
	ret
00102$:
;	./src/stm8s_clk_GetITStatus.c: 64: bitstatus = RESET;
	clr	a
	ret
00108$:
;	./src/stm8s_clk_GetITStatus.c: 70: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c8
	and	a, (0x03, sp)
;	./src/stm8s_clk_GetITStatus.c: 72: bitstatus = SET;
	sub	a, #0x0c
	jrne	00105$
	inc	a
	ret
00105$:
;	./src/stm8s_clk_GetITStatus.c: 76: bitstatus = RESET;
	clr	a
;	./src/stm8s_clk_GetITStatus.c: 81: return bitstatus;
;	./src/stm8s_clk_GetITStatus.c: 82: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
