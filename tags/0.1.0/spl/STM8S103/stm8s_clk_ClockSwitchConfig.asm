;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_clk_ClockSwitchConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_ClockSwitchConfig
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
;	./src/stm8s_clk_ClockSwitchConfig.c: 54: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
;	-----------------------------------------
;	 function CLK_ClockSwitchConfig
;	-----------------------------------------
_CLK_ClockSwitchConfig:
;	./src/stm8s_clk_ClockSwitchConfig.c: 67: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
	ld	a, 0x50c3
	ld	yl, a
;	./src/stm8s_clk_ClockSwitchConfig.c: 73: CLK->SWCR |= CLK_SWCR_SWEN;
	ld	a, 0x50c5
;	./src/stm8s_clk_ClockSwitchConfig.c: 70: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00122$
;	./src/stm8s_clk_ClockSwitchConfig.c: 73: CLK->SWCR |= CLK_SWCR_SWEN;
	or	a, #0x02
	ld	0x50c5, a
	ld	a, 0x50c5
;	./src/stm8s_clk_ClockSwitchConfig.c: 76: if (ITState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	./src/stm8s_clk_ClockSwitchConfig.c: 78: CLK->SWCR |= CLK_SWCR_SWIEN;
	or	a, #0x04
	ld	0x50c5, a
	jra	00103$
00102$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 82: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	and	a, #0xfb
	ld	0x50c5, a
00103$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 86: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
;	./src/stm8s_clk_ClockSwitchConfig.c: 89: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
	clrw	x
	decw	x
00105$:
	ld	a, 0x50c5
	srl	a
	jrnc	00107$
	tnzw	x
	jreq	00107$
;	./src/stm8s_clk_ClockSwitchConfig.c: 91: DownCounter--;
	decw	x
	jra	00105$
00107$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 94: if(DownCounter != 0)
	tnzw	x
	jreq	00109$
;	./src/stm8s_clk_ClockSwitchConfig.c: 96: Swif = SUCCESS;
	ld	a, #0x01
	ld	xl, a
	jra	00123$
00109$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 100: Swif = ERROR;
	clr	a
	ld	xl, a
	jra	00123$
00122$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 106: if (ITState != DISABLE)
	tnz	(0x05, sp)
	jreq	00112$
;	./src/stm8s_clk_ClockSwitchConfig.c: 108: CLK->SWCR |= CLK_SWCR_SWIEN;
	or	a, #0x04
	ld	0x50c5, a
	jra	00113$
00112$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 112: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	and	a, #0xfb
	ld	0x50c5, a
00113$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 116: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
;	./src/stm8s_clk_ClockSwitchConfig.c: 119: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
	clrw	x
	decw	x
00115$:
	ld	a, 0x50c5
	bcp	a, #0x08
	jreq	00117$
	tnzw	x
	jreq	00117$
;	./src/stm8s_clk_ClockSwitchConfig.c: 121: DownCounter--;
	decw	x
	jra	00115$
00117$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 124: if(DownCounter != 0)
	tnzw	x
	jreq	00119$
;	./src/stm8s_clk_ClockSwitchConfig.c: 127: CLK->SWCR |= CLK_SWCR_SWEN;
	bset	20677, #1
;	./src/stm8s_clk_ClockSwitchConfig.c: 128: Swif = SUCCESS;
	ld	a, #0x01
	ld	xl, a
	jra	00123$
00119$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 132: Swif = ERROR;
	clr	a
	ld	xl, a
00123$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 135: if(Swif != ERROR)
	ld	a, xl
	tnz	a
	jreq	00136$
;	./src/stm8s_clk_ClockSwitchConfig.c: 138: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
	tnz	(0x06, sp)
	jrne	00132$
	ld	a, yl
	cp	a, #0xe1
	jrne	00132$
;	./src/stm8s_clk_ClockSwitchConfig.c: 140: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
	bres	20672, #0
	jra	00136$
00132$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 142: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
	tnz	(0x06, sp)
	jrne	00128$
	ld	a, yl
	cp	a, #0xd2
	jrne	00128$
;	./src/stm8s_clk_ClockSwitchConfig.c: 144: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	bres	20672, #3
	jra	00136$
00128$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 146: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
	tnz	(0x06, sp)
	jrne	00136$
	ld	a, yl
	cp	a, #0xb4
	jrne	00136$
;	./src/stm8s_clk_ClockSwitchConfig.c: 148: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
	bres	20673, #0
00136$:
;	./src/stm8s_clk_ClockSwitchConfig.c: 151: return(Swif);
	ld	a, xl
;	./src/stm8s_clk_ClockSwitchConfig.c: 152: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
