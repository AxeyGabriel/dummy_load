;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_Init
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
;	./src/stm8s_i2c_Init.c: 58: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
;	-----------------------------------------
;	 function I2C_Init
;	-----------------------------------------
_I2C_Init:
	sub	sp, #11
;	./src/stm8s_i2c_Init.c: 64: uint8_t tmpccrh = 0;
	clr	(0x09, sp)
;	./src/stm8s_i2c_Init.c: 77: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	./src/stm8s_i2c_Init.c: 79: I2C->FREQR |= InputClockFrequencyMHz;
	ld	a, 0x5212
	or	a, (0x17, sp)
	ld	0x5212, a
;	./src/stm8s_i2c_Init.c: 83: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	21008, #0
;	./src/stm8s_i2c_Init.c: 86: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	./src/stm8s_i2c_Init.c: 87: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	./src/stm8s_i2c_Init.c: 98: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	clrw	x
	ld	a, (0x17, sp)
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
;	./src/stm8s_i2c_Init.c: 90: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
	ldw	x, #0x86a0
	cpw	x, (0x10, sp)
	ld	a, #0x01
	sbc	a, (0x0f, sp)
	clr	a
	sbc	a, (0x0e, sp)
	jrc	00133$
	jp	00109$
00133$:
;	./src/stm8s_i2c_Init.c: 93: tmpccrh = I2C_CCRH_FS;
	ld	a, #0x80
	ld	(0x09, sp), a
;	./src/stm8s_i2c_Init.c: 95: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
	tnz	(0x14, sp)
	jrne	00102$
;	./src/stm8s_i2c_Init.c: 98: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x0a, sp), x
	jra	00103$
00102$:
;	./src/stm8s_i2c_Init.c: 103: result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	push	#0x19
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x0a, sp), x
	ldw	(0x08, sp), y
;	./src/stm8s_i2c_Init.c: 105: tmpccrh |= I2C_CCRH_DUTY;
	ld	a, #0xc0
	ld	(0x09, sp), a
00103$:
;	./src/stm8s_i2c_Init.c: 109: if (result < (uint16_t)0x01)
	ldw	x, (0x0a, sp)
	cpw	x, #0x0001
	jrnc	00105$
;	./src/stm8s_i2c_Init.c: 112: result = (uint16_t)0x0001;
	ldw	x, #0x0001
	ldw	(0x0a, sp), x
00105$:
;	./src/stm8s_i2c_Init.c: 118: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
	clrw	x
	ld	a, (0x17, sp)
	ld	xl, a
	pushw	x
	sllw	x
	addw	x, (1, sp)
	addw	sp, #2
	push	#0x0a
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	incw	x
	ld	a, xl
;	./src/stm8s_i2c_Init.c: 119: I2C->TRISER = (uint8_t)tmpval;
	ld	0x521d, a
	jra	00110$
00109$:
;	./src/stm8s_i2c_Init.c: 126: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
	ldw	x, (0x10, sp)
	ldw	y, (0x0e, sp)
	sllw	x
	rlcw	y
	pushw	x
	pushw	y
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	./src/stm8s_i2c_Init.c: 129: if (result < (uint16_t)0x0004)
	ldw	(0x0a, sp), x
	cpw	x, #0x0004
	jrnc	00107$
;	./src/stm8s_i2c_Init.c: 132: result = (uint16_t)0x0004;
	ldw	x, #0x0004
	ldw	(0x0a, sp), x
00107$:
;	./src/stm8s_i2c_Init.c: 138: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
	ld	a, (0x17, sp)
	inc	a
	ld	0x521d, a
00110$:
;	./src/stm8s_i2c_Init.c: 143: I2C->CCRL = (uint8_t)result;
	ld	a, (0x0b, sp)
	ld	0x521b, a
;	./src/stm8s_i2c_Init.c: 144: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
	ld	a, (0x0a, sp)
	ld	(0x0b, sp), a
	clr	(0x0a, sp)
	ld	a, (0x0b, sp)
	and	a, #0x0f
	or	a, (0x09, sp)
	ld	0x521c, a
;	./src/stm8s_i2c_Init.c: 147: I2C->CR1 |= I2C_CR1_PE;
	bset	21008, #0
;	./src/stm8s_i2c_Init.c: 150: I2C_AcknowledgeConfig(Ack);
	ld	a, (0x15, sp)
	push	a
	call	_I2C_AcknowledgeConfig
	pop	a
;	./src/stm8s_i2c_Init.c: 153: I2C->OARL = (uint8_t)(OwnAddress);
	ld	a, (0x13, sp)
	ld	0x5213, a
;	./src/stm8s_i2c_Init.c: 154: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
	ld	a, (0x16, sp)
	or	a, #0x40
	ld	(0x0b, sp), a
;	./src/stm8s_i2c_Init.c: 155: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
	clr	a
	ld	xl, a
	ld	a, (0x12, sp)
	and	a, #0x03
	ld	xh, a
	ld	a, #0x80
	div	x, a
	ld	a, xl
	or	a, (0x0b, sp)
	ld	0x5214, a
;	./src/stm8s_i2c_Init.c: 156: }
	addw	sp, #11
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
