;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_GetLastEvent
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_GetLastEvent
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
;	./src/stm8s_i2c_GetLastEvent.c: 51: I2C_Event_TypeDef I2C_GetLastEvent(void)
;	-----------------------------------------
;	 function I2C_GetLastEvent
;	-----------------------------------------
_I2C_GetLastEvent:
	sub	sp, #4
;	./src/stm8s_i2c_GetLastEvent.c: 53: __IO uint16_t lastevent = 0;
	clrw	x
	ldw	(0x01, sp), x
;	./src/stm8s_i2c_GetLastEvent.c: 57: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
	ld	a, 0x5218
	bcp	a, #0x04
	jreq	00102$
;	./src/stm8s_i2c_GetLastEvent.c: 59: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
	ldw	x, #0x0004
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	./src/stm8s_i2c_GetLastEvent.c: 64: flag1 = I2C->SR1;
	ld	a, 0x5217
	clrw	x
	ld	xl, a
	ldw	(0x03, sp), x
;	./src/stm8s_i2c_GetLastEvent.c: 65: flag2 = I2C->SR3;
	ld	a, 0x5219
	ld	xh, a
;	./src/stm8s_i2c_GetLastEvent.c: 68: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
	ld	a, (0x04, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
	ldw	(0x01, sp), x
00103$:
;	./src/stm8s_i2c_GetLastEvent.c: 71: return (I2C_Event_TypeDef)lastevent;
	ldw	x, (0x01, sp)
;	./src/stm8s_i2c_GetLastEvent.c: 72: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
