;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_GetITStatus
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
;	./src/stm8s_i2c_GetITStatus.c: 62: ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_GetITStatus
;	-----------------------------------------
_I2C_GetITStatus:
	sub	sp, #4
;	./src/stm8s_i2c_GetITStatus.c: 65: __IO uint8_t enablestatus = 0;
	clr	(0x03, sp)
;	./src/stm8s_i2c_GetITStatus.c: 71: tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
	clr	(0x02, sp)
	ld	a, (0x07, sp)
	and	a, #0x07
	ld	(0x04, sp), a
;	./src/stm8s_i2c_GetITStatus.c: 74: enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
	ld	a, 0x521a
	and	a, (0x04, sp)
	ld	(0x03, sp), a
;	./src/stm8s_i2c_GetITStatus.c: 76: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	clr	a
	ld	xl, a
	ld	a, (0x07, sp)
	and	a, #0x30
	ld	xh, a
;	./src/stm8s_i2c_GetITStatus.c: 79: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, (0x08, sp)
	ld	(0x04, sp), a
;	./src/stm8s_i2c_GetITStatus.c: 76: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	cpw	x, #0x0100
	jrne	00110$
;	./src/stm8s_i2c_GetITStatus.c: 79: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5217
	and	a, (0x04, sp)
	jreq	00102$
	tnz	(0x03, sp)
	jreq	00102$
;	./src/stm8s_i2c_GetITStatus.c: 82: bitstatus = SET;
	ld	a, #0x01
	jra	00111$
00102$:
;	./src/stm8s_i2c_GetITStatus.c: 87: bitstatus = RESET;
	clr	a
	jra	00111$
00110$:
;	./src/stm8s_i2c_GetITStatus.c: 93: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
	ld	a, 0x5218
	and	a, (0x04, sp)
	jreq	00106$
	tnz	(0x03, sp)
	jreq	00106$
;	./src/stm8s_i2c_GetITStatus.c: 96: bitstatus = SET;
	ld	a, #0x01
;	./src/stm8s_i2c_GetITStatus.c: 101: bitstatus = RESET;
	.byte 0x21
00106$:
	clr	a
00111$:
;	./src/stm8s_i2c_GetITStatus.c: 105: return  bitstatus;
;	./src/stm8s_i2c_GetITStatus.c: 106: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
