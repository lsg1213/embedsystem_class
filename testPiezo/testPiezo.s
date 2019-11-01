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
	.file	"testPiezo.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #20
	ldr	r4, .L7
	mov	r3, #0
	strb	r3, [sp, #7]
	add	r3, sp, #8
.LPIC0:
	add	r4, pc, r4
	ldr	r0, [r4, #0]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	stmia	r3!, {r0, r1}
	mov	r1, #1
	ldr	r0, .L7+4
.LPIC1:
	add	r0, pc, r0
	bl	open(PLT)
	subs	r5, r0, #0
	beq	.L6
.L2:
	mov	r4, #0
.L3:
	add	r3, sp, #8
	mov	r2, #1
	add	r1, r3, r4
	mov	r0, r5
	add	r4, r4, r2
	bl	write(PLT)
	movw	r0, #41248
	movt	r0, 7
	bl	usleep(PLT)
	mov	r0, r5
	add	r1, sp, #7
	mov	r2, #1
	bl	write(PLT)
	cmp	r4, #8
	bne	.L3
	mov	r0, r5
	bl	close(PLT)
	mov	r0, #0
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, pc}
.L6:
	ldr	r0, .L7+8
	add	r2, r4, #8
	ldr	r3, .L7+12
	mov	r1, #16
.LPIC2:
	add	r0, pc, r0
.LPIC4:
	add	r3, pc, r3
	bl	__assert2(PLT)
	b	.L2
.L8:
	.align	2
.L7:
	.word	.LANCHOR0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC4+8)
	.size	main, .-main
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
.LC0:
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	33
	.type	__PRETTY_FUNCTION__.5479, %object
	.size	__PRETTY_FUNCTION__.5479, 5
__PRETTY_FUNCTION__.5479:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"/dev/fpga_piezo\000"
.LC2:
	.ascii	"testPiezo.c\000"
.LC3:
	.ascii	"fd != 0\000"
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
