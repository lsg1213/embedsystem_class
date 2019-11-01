	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"testDipsw.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L8
	mov	r1, #0
	stmfd	sp!, {r4, r5, r6, r7, lr}
.LPIC0:
	add	r0, pc, r0
	sub	sp, sp, #12
	ldr	r5, .L8+4
	bl	open(PLT)
.LPIC4:
	add	r5, pc, r5
	subs	r7, r0, #0
	beq	.L5
	ldr	r3, .L8+8
	add	r4, sp, #6
	ldr	r5, [r5, r3]
.L3:
	ldr	r6, .L8+12
	add	r5, r5, #84
.LPIC5:
	add	r6, pc, r6
.L6:
	mov	r1, r4
	mov	r0, r7
	mov	r2, #2
	bl	read(PLT)
	mov	r0, r5
	mov	r1, r6
	ldrh	r2, [sp, #6]
	bl	fprintf(PLT)
	mov	r0, #1
	bl	sleep(PLT)
	b	.L6
.L5:
	ldr	r0, .L8+16
	mov	r1, #10
	ldr	r2, .L8+20
	add	r4, sp, #6
	ldr	r3, .L8+24
.LPIC1:
	add	r0, pc, r0
.LPIC2:
	add	r2, pc, r2
.LPIC3:
	add	r3, pc, r3
	bl	__assert2(PLT)
	ldr	r3, .L8+8
	ldr	r5, [r5, r3]
	b	.L3
.L9:
	.align	2
.L8:
	.word	.LC0-(.LPIC0+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+8)
	.word	__sF(GOT)
	.word	.LC3-(.LPIC5+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LANCHOR0-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.5279, %object
	.size	__PRETTY_FUNCTION__.5279, 5
__PRETTY_FUNCTION__.5279:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/dev/fpga_dipsw\000"
.LC1:
	.ascii	"testDipsw.c\000"
.LC2:
	.ascii	"fd != 0\000"
.LC3:
	.ascii	"value : 0x%04x\012\000"
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
