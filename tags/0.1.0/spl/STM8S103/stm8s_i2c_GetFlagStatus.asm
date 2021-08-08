;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_GetFlagStatus
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
;	./src/stm8s_i2c_GetFlagStatus.c: 65: FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
;	-----------------------------------------
;	 function I2C_GetFlagStatus
;	-----------------------------------------
_I2C_GetFlagStatus:
;	./src/stm8s_i2c_GetFlagStatus.c: 67: uint8_t tempreg = 0;
	clr	a
	ld	xl, a
;	./src/stm8s_i2c_GetFlagStatus.c: 75: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
	ld	a, (0x03, sp)
	clrw	y
;	./src/stm8s_i2c_GetFlagStatus.c: 77: switch (regindex)
	cp	a, #0x01
	jreq	00101$
	cp	a, #0x02
	jreq	00102$
	cp	a, #0x03
	jreq	00103$
	jra	00105$
;	./src/stm8s_i2c_GetFlagStatus.c: 80: case 0x01:
00101$:
;	./src/stm8s_i2c_GetFlagStatus.c: 81: tempreg = (uint8_t)I2C->SR1;
	ld	a, 0x5217
	ld	xl, a
;	./src/stm8s_i2c_GetFlagStatus.c: 82: break;
	jra	00105$
;	./src/stm8s_i2c_GetFlagStatus.c: 85: case 0x02:
00102$:
;	./src/stm8s_i2c_GetFlagStatus.c: 86: tempreg = (uint8_t)I2C->SR2;
	ld	a, 0x5218
	ld	xl, a
;	./src/stm8s_i2c_GetFlagStatus.c: 87: break;
	jra	00105$
;	./src/stm8s_i2c_GetFlagStatus.c: 90: case 0x03:
00103$:
;	./src/stm8s_i2c_GetFlagStatus.c: 91: tempreg = (uint8_t)I2C->SR3;
	ld	a, 0x5219
	ld	xl, a
;	./src/stm8s_i2c_GetFlagStatus.c: 96: }
00105$:
;	./src/stm8s_i2c_GetFlagStatus.c: 99: if ((tempreg & (uint8_t)I2C_Flag ) != 0)
	ld	a, (0x04, sp)
	pushw	x
	and	a, (2, sp)
	popw	x
	tnz	a
	jreq	00107$
;	./src/stm8s_i2c_GetFlagStatus.c: 102: bitstatus = SET;
	ld	a, #0x01
	ret
00107$:
;	./src/stm8s_i2c_GetFlagStatus.c: 107: bitstatus = RESET;
	clr	a
;	./src/stm8s_i2c_GetFlagStatus.c: 110: return bitstatus;
;	./src/stm8s_i2c_GetFlagStatus.c: 111: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
