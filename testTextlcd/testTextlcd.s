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
	.file	"testTextlcd.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L6
	mov	r1, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LPIC0:
	add	r0, pc, r0
	sub	sp, sp, #40
	ldr	r5, .L6+4
	bl	open(PLT)
.LPIC5:
	add	r5, pc, r5
	cmn	r0, #1
	mov	r4, r0
	beq	.L5
.L2:
	mov	r0, r4
	mov	r1, #3
	bl	ioctl(PLT)
	ldr	r3, .L6+8
	ldr	r9, .L6+12
	ldr	r7, .L6+16
	ldr	r6, [r5, r3]
.LPIC4:
	add	r9, pc, r9
	ldr	sl, .L6+20
.LPIC6:
	add	r7, pc, r7
	ldr	r8, .L6+24
	add	r5, r6, #84
.LPIC7:
	add	sl, pc, sl
.LPIC9:
	add	r8, pc, r8
.L3:
	mov	r3, r5
	mov	r0, r9
	mov	r1, #1
	mov	r2, #14
	bl	fwrite(PLT)
	mov	r1, r7
	mov	r2, sp
	mov	r0, r6
	bl	fscanf(PLT)
	mov	r3, r5
	mov	r0, sl
	mov	r1, #1
	mov	r2, #14
	bl	fwrite(PLT)
	mov	r1, r7
	add	r2, sp, #20
	mov	r0, r6
	bl	fscanf(PLT)
	add	r3, sp, #20
	mov	r2, sp
	mov	r1, r8
	mov	r0, r5
	bl	fprintf(PLT)
	mov	r0, r4
	mov	r1, #4
	bl	ioctl(PLT)
	mov	r1, #5
	mov	r0, r4
	bl	ioctl(PLT)
	mov	r0, sp
	bl	strlen(PLT)
	mov	r1, sp
	mov	r2, r0
	mov	r0, r4
	bl	write(PLT)
	mov	r1, #6
	mov	r0, r4
	bl	ioctl(PLT)
	add	r0, sp, #20
	bl	strlen(PLT)
	add	r1, sp, #20
	mov	r2, r0
	mov	r0, r4
	bl	write(PLT)
	b	.L3
.L5:
	ldr	r0, .L6+28
	mov	r1, #13
	ldr	r2, .L6+32
	ldr	r3, .L6+36
.LPIC1:
	add	r0, pc, r0
.LPIC2:
	add	r2, pc, r2
.LPIC3:
	add	r3, pc, r3
	bl	__assert2(PLT)
	b	.L2
.L7:
	.align	2
.L6:
	.word	.LC0-(.LPIC0+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.word	__sF(GOT)
	.word	.LC3-(.LPIC4+8)
	.word	.LC4-(.LPIC6+8)
	.word	.LC5-(.LPIC7+8)
	.word	.LC6-(.LPIC9+8)
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
	.ascii	"/dev/fpga_textlcd\000"
	.space	2
.LC1:
	.ascii	"testTextlcd.c\000"
	.space	2
.LC2:
	.ascii	"fd != -1\000"
	.space	3
.LC3:
	.ascii	"1st line msg: \000"
	.space	1
.LC4:
	.ascii	"%16s\000"
	.space	3
.LC5:
	.ascii	"2nd line msg: \000"
	.space	1
.LC6:
	.ascii	"%s\012%s\012\000"
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
