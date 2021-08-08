;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_flash_ProgramOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_ProgramOptionByte
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
;	./src/stm8s_flash_ProgramOptionByte.c: 48: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramOptionByte
;	-----------------------------------------
_FLASH_ProgramOptionByte:
;	./src/stm8s_flash_ProgramOptionByte.c: 54: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	./src/stm8s_flash_ProgramOptionByte.c: 55: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	20572, #7
;	./src/stm8s_flash_ProgramOptionByte.c: 61: *((NEAR uint8_t*)Address) = Data;
	ldw	x, (0x03, sp)
;	./src/stm8s_flash_ProgramOptionByte.c: 58: if(Address == 0x4800)
	pushw	x
	ldw	x, (0x05, sp)
	cpw	x, #0x4800
	popw	x
	jrne	00102$
;	./src/stm8s_flash_ProgramOptionByte.c: 61: *((NEAR uint8_t*)Address) = Data;
	ld	a, (0x05, sp)
	ld	(x), a
	jra	00103$
00102$:
;	./src/stm8s_flash_ProgramOptionByte.c: 66: *((NEAR uint8_t*)Address) = Data;
	ld	a, (0x05, sp)
	ld	(x), a
;	./src/stm8s_flash_ProgramOptionByte.c: 67: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
	ldw	x, (0x03, sp)
	incw	x
	ld	a, (0x05, sp)
	cpl	a
	ld	(x), a
00103$:
;	./src/stm8s_flash_ProgramOptionByte.c: 69: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	./src/stm8s_flash_ProgramOptionByte.c: 72: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	./src/stm8s_flash_ProgramOptionByte.c: 73: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	./src/stm8s_flash_ProgramOptionByte.c: 74: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
