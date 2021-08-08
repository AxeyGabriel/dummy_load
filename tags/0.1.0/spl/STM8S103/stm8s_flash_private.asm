;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_flash_private
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseBlock
	.globl _FLASH_ProgramBlock
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
;	./src/stm8s_flash_private.c: 120: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
;	-----------------------------------------
;	 function FLASH_WaitForLastOperation
;	-----------------------------------------
_FLASH_WaitForLastOperation:
;	./src/stm8s_flash_private.c: 122: uint8_t flagstatus = 0x00;
	clr	a
;	./src/stm8s_flash_private.c: 147: while((flagstatus == 0x00) && (timeout != 0x00))
	clrw	x
	decw	x
00102$:
	tnz	a
	jrne	00104$
	tnzw	x
	jreq	00104$
;	./src/stm8s_flash_private.c: 149: flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
	ld	a, 0x505f
	and	a, #0x05
;	./src/stm8s_flash_private.c: 150: timeout--;
	decw	x
	jra	00102$
00104$:
;	./src/stm8s_flash_private.c: 154: if(timeout == 0x00 )
	tnzw	x
	jreq	00132$
	ret
00132$:
;	./src/stm8s_flash_private.c: 156: flagstatus = FLASH_STATUS_TIMEOUT;
	ld	a, #0x02
;	./src/stm8s_flash_private.c: 159: return((FLASH_Status_TypeDef)flagstatus);
;	./src/stm8s_flash_private.c: 160: }
	ret
;	./src/stm8s_flash_private.c: 169: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
;	-----------------------------------------
;	 function FLASH_EraseBlock
;	-----------------------------------------
_FLASH_EraseBlock:
	sub	sp, #6
;	./src/stm8s_flash_private.c: 182: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0b, sp)
	cp	a, #0xfd
	jrne	00102$
;	./src/stm8s_flash_private.c: 185: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	./src/stm8s_flash_private.c: 190: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
00103$:
;	./src/stm8s_flash_private.c: 198: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
	ldw	x, (0x09, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
	ld	a, (0x04, sp)
	rlwa	x
	ld	a, (0x03, sp)
	rrwa	x
	ld	xl, a
	addw	x, (0x05, sp)
;	./src/stm8s_flash_private.c: 202: FLASH->CR2 |= FLASH_CR2_ERASE;
	bset	20571, #5
;	./src/stm8s_flash_private.c: 203: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
	bres	20572, #5
;	./src/stm8s_flash_private.c: 207: *pwFlash = (uint32_t)0;
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	./src/stm8s_flash_private.c: 215: }
	addw	sp, #6
	ret
;	./src/stm8s_flash_private.c: 226: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
;	-----------------------------------------
;	 function FLASH_ProgramBlock
;	-----------------------------------------
_FLASH_ProgramBlock:
	sub	sp, #8
;	./src/stm8s_flash_private.c: 235: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0d, sp)
	cp	a, #0xfd
	jrne	00102$
;	./src/stm8s_flash_private.c: 238: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	./src/stm8s_flash_private.c: 243: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
00103$:
;	./src/stm8s_flash_private.c: 247: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
	ldw	y, (0x0b, sp)
	clrw	x
	push	a
	ld	a, #0x06
00131$:
	sllw	y
	rlcw	x
	dec	a
	jrne	00131$
	ldw	(0x08, sp), y
	pop	a
	ldw	y, (0x07, sp)
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x02, sp)
	rlwa	x
	adc	a, (0x01, sp)
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
;	./src/stm8s_flash_private.c: 253: FLASH->CR2 |= FLASH_CR2_PRG;
	ld	a, 0x505b
;	./src/stm8s_flash_private.c: 250: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
	tnz	(0x0e, sp)
	jrne	00105$
;	./src/stm8s_flash_private.c: 253: FLASH->CR2 |= FLASH_CR2_PRG;
	or	a, #0x01
	ld	0x505b, a
;	./src/stm8s_flash_private.c: 254: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
	bres	20572, #0
	jra	00114$
00105$:
;	./src/stm8s_flash_private.c: 259: FLASH->CR2 |= FLASH_CR2_FPRG;
	or	a, #0x10
	ld	0x505b, a
;	./src/stm8s_flash_private.c: 260: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
	bres	20572, #4
;	./src/stm8s_flash_private.c: 264: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
00114$:
	clrw	y
00108$:
;	./src/stm8s_flash_private.c: 266: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
	ldw	x, (0x03, sp)
	ldw	(0x05, sp), x
	ldw	x, y
	addw	x, (0x05, sp)
	ldw	(0x07, sp), x
	ldw	x, y
	addw	x, (0x0f, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ld	(x), a
;	./src/stm8s_flash_private.c: 264: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
	incw	y
	cpw	y, #0x0040
	jrc	00108$
;	./src/stm8s_flash_private.c: 268: }
	addw	sp, #8
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
