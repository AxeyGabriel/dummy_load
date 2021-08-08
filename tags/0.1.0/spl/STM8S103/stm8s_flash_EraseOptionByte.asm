;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_flash_EraseOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseOptionByte
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
;	./src/stm8s_flash_EraseOptionByte.c: 47: void FLASH_EraseOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_EraseOptionByte
;	-----------------------------------------
_FLASH_EraseOptionByte:
;	./src/stm8s_flash_EraseOptionByte.c: 53: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	./src/stm8s_flash_EraseOptionByte.c: 54: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	20572, #7
;	./src/stm8s_flash_EraseOptionByte.c: 60: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	ldw	y, (0x03, sp)
;	./src/stm8s_flash_EraseOptionByte.c: 57: if(Address == 0x4800)
	ldw	x, (0x03, sp)
	cpw	x, #0x4800
	jrne	00102$
;	./src/stm8s_flash_EraseOptionByte.c: 60: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(y)
	jra	00103$
00102$:
;	./src/stm8s_flash_EraseOptionByte.c: 65: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(y)
;	./src/stm8s_flash_EraseOptionByte.c: 66: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
	ldw	x, (0x03, sp)
	incw	x
	ld	a, #0xff
	ld	(x), a
00103$:
;	./src/stm8s_flash_EraseOptionByte.c: 68: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	./src/stm8s_flash_EraseOptionByte.c: 71: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	./src/stm8s_flash_EraseOptionByte.c: 72: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	./src/stm8s_flash_EraseOptionByte.c: 73: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
