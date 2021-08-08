;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_CheckEvent
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_CheckEvent
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
;	./src/stm8s_i2c_CheckEvent.c: 71: ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
;	-----------------------------------------
;	 function I2C_CheckEvent
;	-----------------------------------------
_I2C_CheckEvent:
	sub	sp, #8
;	./src/stm8s_i2c_CheckEvent.c: 73: __IO uint16_t lastevent = 0x00;
	clrw	x
	ldw	(0x01, sp), x
;	./src/stm8s_i2c_CheckEvent.c: 81: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
	ldw	x, (0x0b, sp)
	cpw	x, #0x0004
	jrne	00102$
;	./src/stm8s_i2c_CheckEvent.c: 83: lastevent = I2C->SR2 & I2C_SR2_AF;
	ld	a, 0x5218
	and	a, #0x04
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	./src/stm8s_i2c_CheckEvent.c: 87: flag1 = I2C->SR1;
	ld	a, 0x5217
	ld	xh, a
;	./src/stm8s_i2c_CheckEvent.c: 88: flag2 = I2C->SR3;
	ld	a, 0x5219
;	./src/stm8s_i2c_CheckEvent.c: 89: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
	ld	xl, a
	clr	a
	clr	(0x04, sp)
	rlwa	x
	ld	(0x06, sp), a
	rrwa	x
	clr	(0x05, sp)
	ld	a, (0x04, sp)
	or	a, (0x06, sp)
	ld	(0x08, sp), a
	ld	a, xl
	or	a, (0x05, sp)
	ld	(0x01, sp), a
	ld	a, (0x08, sp)
	ld	(0x02, sp), a
00103$:
;	./src/stm8s_i2c_CheckEvent.c: 92: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
	ld	a, (0x02, sp)
	and	a, (0x0c, sp)
	ld	xl, a
	ld	a, (0x01, sp)
	and	a, (0x0b, sp)
	ld	xh, a
	cpw	x, (0x0b, sp)
	jrne	00105$
;	./src/stm8s_i2c_CheckEvent.c: 95: status = SUCCESS;
	ld	a, #0x01
;	./src/stm8s_i2c_CheckEvent.c: 100: status = ERROR;
	.byte 0x21
00105$:
	clr	a
00106$:
;	./src/stm8s_i2c_CheckEvent.c: 104: return status;
;	./src/stm8s_i2c_CheckEvent.c: 105: }
	addw	sp, #8
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
