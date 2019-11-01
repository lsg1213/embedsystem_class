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
	.file	"testLed.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L8
	mov	r1, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LPIC0:
	add	r0, pc, r0
	sub	sp, sp, #8
	ldr	r4, .L8+4
	bl	open(PLT)
.LPIC5:
	add	r4, pc, r4
	cmn	r0, #1
	mov	r5, r0
	beq	.L5
	ldr	r3, .L8+8
	add	r7, sp, #4
	add	r6, sp, #3
	ldr	r4, [r4, r3]
.L3:
	ldr	r9, .L8+12
	add	sl, r4, #84
	ldr	r8, .L8+16
.LPIC4:
	add	r9, pc, r9
.LPIC6:
	add	r8, pc, r8
.L6:
	mov	r3, sl
	mov	r0, r9
	mov	r1, #1
	mov	r2, #26
	bl	fwrite(PLT)
	mov	r1, r8
	mov	r2, r7
	mov	r0, r4
	bl	fscanf(PLT)
	ldr	ip, [sp, #4]
	mov	r0, r5
	mov	r1, r6
	mov	r2, #1
	strb	ip, [sp, #3]
	bl	write(PLT)
	b	.L6
.L5:
	ldr	r0, .L8+20
	mov	r1, #12
	ldr	r2, .L8+24
	add	r7, sp, #4
	ldr	r3, .L8+28
.LPIC1:
	add	r0, pc, r0
.LPIC2:
	add	r2, pc, r2
	add	r6, sp, #3
.LPIC3:
	add	r3, pc, r3
	bl	__assert2(PLT)
	ldr	r3, .L8+8
	ldr	r4, [r4, r3]
	b	.L3
.L9:
	.align	2
.L8:
	.word	.LC0-(.LPIC0+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.word	__sF(GOT)
	.word	.LC3-(.LPIC4+8)
	.word	.LC4-(.LPIC6+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LANCHOR0-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.5476, %object
	.size	__PRETTY_FUNCTION__.5476, 5
__PRETTY_FUNCTION__.5476:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/dev/fpga_led\000"
	.space	2
.LC1:
	.ascii	"testLed.c\000"
	.space	2
.LC2:
	.ascii	"fd != -1\000"
	.space	3
.LC3:
	.ascii	"Input LED value [0-255] : \000"
	.space	1
.LC4:
	.ascii	"%d\000"
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
