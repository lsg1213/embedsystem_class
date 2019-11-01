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
	.file	"testSegment.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L7
	mov	r1, #1
	stmfd	sp!, {r4, r5, lr}
.LPIC0:
	add	r0, pc, r0
	sub	sp, sp, #28
	bl	open(PLT)
	subs	r5, r0, #0
	bge	.L2
	ldr	r0, .L7+4
	mov	r1, #17
	ldr	r2, .L7+8
	ldr	r3, .L7+12
.LPIC1:
	add	r0, pc, r0
.LPIC2:
	add	r2, pc, r2
.LPIC3:
	add	r3, pc, r3
	bl	__assert2(PLT)
.L2:
	ldr	r4, .L7+16
.LPIC4:
	add	r4, pc, r4
.L5:
	add	r0, sp, #12
	bl	time(PLT)
	add	r0, sp, #12
	bl	localtime(PLT)
	mov	r1, r4
	mov	ip, r0
	ldr	r2, [r0, #8]
	ldr	r3, [ip, #4]
	add	r0, sp, #16
	ldr	ip, [ip, #0]
	str	ip, [sp, #0]
	bl	sprintf(PLT)
	mov	r0, r5
	add	r1, sp, #16
	mov	r2, #6
	bl	write(PLT)
	b	.L5
.L8:
	.align	2
.L7:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LANCHOR0-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.word	.LC3-(.LPIC4+8)
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.5367, %object
	.size	__PRETTY_FUNCTION__.5367, 5
__PRETTY_FUNCTION__.5367:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/dev/fpga_segment\000"
	.space	2
.LC1:
	.ascii	"testSegment.c\000"
	.space	2
.LC2:
	.ascii	"fd >= 0\000"
.LC3:
	.ascii	"%02d%02d%02d\000"
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
