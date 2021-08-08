;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_clk_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_ITConfig
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
;	./src/stm8s_clk_ITConfig.c: 50: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_ITConfig
;	-----------------------------------------
_CLK_ITConfig:
	push	a
;	./src/stm8s_clk_ITConfig.c: 58: switch (CLK_IT)
	ld	a, (0x04, sp)
	sub	a, #0x0c
	jrne	00140$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00140$:
	clr	(0x01, sp)
00141$:
	ld	a, (0x04, sp)
	sub	a, #0x1c
	jrne	00143$
	inc	a
	.byte 0x21
00143$:
	clr	a
00144$:
;	./src/stm8s_clk_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00110$
;	./src/stm8s_clk_ITConfig.c: 58: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00102$
	tnz	a
	jreq	00112$
;	./src/stm8s_clk_ITConfig.c: 61: CLK->SWCR |= CLK_SWCR_SWIEN;
	bset	20677, #2
;	./src/stm8s_clk_ITConfig.c: 62: break;
	jra	00112$
;	./src/stm8s_clk_ITConfig.c: 63: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
00102$:
;	./src/stm8s_clk_ITConfig.c: 64: CLK->CSSR |= CLK_CSSR_CSSDIE;
	bset	20680, #2
;	./src/stm8s_clk_ITConfig.c: 65: break;
	jra	00112$
;	./src/stm8s_clk_ITConfig.c: 68: }
00110$:
;	./src/stm8s_clk_ITConfig.c: 72: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00106$
	tnz	a
	jreq	00112$
;	./src/stm8s_clk_ITConfig.c: 75: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
	bres	20677, #2
;	./src/stm8s_clk_ITConfig.c: 76: break;
	jra	00112$
;	./src/stm8s_clk_ITConfig.c: 77: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
00106$:
;	./src/stm8s_clk_ITConfig.c: 78: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
	bres	20680, #2
;	./src/stm8s_clk_ITConfig.c: 82: }
00112$:
;	./src/stm8s_clk_ITConfig.c: 84: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
