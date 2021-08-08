;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_clk_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_GetFlagStatus
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
;	./src/stm8s_clk_GetFlagStatus.c: 49: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
;	-----------------------------------------
;	 function CLK_GetFlagStatus
;	-----------------------------------------
_CLK_GetFlagStatus:
	push	a
;	./src/stm8s_clk_GetFlagStatus.c: 59: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
	clr	a
	ld	xl, a
	ld	a, (0x04, sp)
	ld	xh, a
;	./src/stm8s_clk_GetFlagStatus.c: 62: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
	cpw	x, #0x0100
	jrne	00111$
;	./src/stm8s_clk_GetFlagStatus.c: 64: tmpreg = CLK->ICKR;
	ld	a, 0x50c0
	jra	00112$
00111$:
;	./src/stm8s_clk_GetFlagStatus.c: 66: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
	cpw	x, #0x0200
	jrne	00108$
;	./src/stm8s_clk_GetFlagStatus.c: 68: tmpreg = CLK->ECKR;
	ld	a, 0x50c1
	jra	00112$
00108$:
;	./src/stm8s_clk_GetFlagStatus.c: 70: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
	cpw	x, #0x0300
	jrne	00105$
;	./src/stm8s_clk_GetFlagStatus.c: 72: tmpreg = CLK->SWCR;
	ld	a, 0x50c5
	jra	00112$
00105$:
;	./src/stm8s_clk_GetFlagStatus.c: 74: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
	cpw	x, #0x0400
	jrne	00102$
;	./src/stm8s_clk_GetFlagStatus.c: 76: tmpreg = CLK->CSSR;
	ld	a, 0x50c8
	jra	00112$
00102$:
;	./src/stm8s_clk_GetFlagStatus.c: 80: tmpreg = CLK->CCOR;
	ld	a, 0x50c9
00112$:
;	./src/stm8s_clk_GetFlagStatus.c: 83: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
	push	a
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	jreq	00114$
;	./src/stm8s_clk_GetFlagStatus.c: 85: bitstatus = SET;
	ld	a, #0x01
;	./src/stm8s_clk_GetFlagStatus.c: 89: bitstatus = RESET;
	.byte 0x21
00114$:
	clr	a
00115$:
;	./src/stm8s_clk_GetFlagStatus.c: 93: return((FlagStatus)bitstatus);
;	./src/stm8s_clk_GetFlagStatus.c: 94: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
