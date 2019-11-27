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
	.file	"sjl_fpgafullcolorled_test.c"
	.text
	.align	2
	.global	print_menu
	.type	print_menu, %function
print_menu:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r0, #10
	ldr	r4, .L2
	bl	putchar(PLT)
	ldr	r5, .L2+4
.LPIC0:
	add	r4, pc, r4
.LPIC2:
	add	r5, pc, r5
	mov	r0, r4
	bl	puts(PLT)
	ldr	r0, .L2+8
.LPIC1:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L2+12
.LPIC3:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L2+16
.LPIC4:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L2+20
.LPIC5:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L2+24
.LPIC6:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L2+28
.LPIC7:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	b	puts(PLT)
.L3:
	.align	2
.L2:
	.word	.LC0-(.LPIC0+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC1-(.LPIC1+8)
	.word	.LC3-(.LPIC3+8)
	.word	.LC4-(.LPIC4+8)
	.word	.LC5-(.LPIC5+8)
	.word	.LC6-(.LPIC6+8)
	.word	.LC7-(.LPIC7+8)
	.size	print_menu, .-print_menu
	.align	2
	.global	ItemSelect
	.type	ItemSelect, %function
ItemSelect:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	mov	r3, #0
	ldr	r7, .L27
	strh	r3, [sp, #12]	@ movhi
	strb	r3, [sp, #14]
.LPIC11:
	add	r7, pc, r7
	ldr	r3, .L27+4
	ldr	fp, .L27+8
	ldr	r10, .L27+12
.LPIC10:
	add	r3, pc, r3
	ldr	r4, .L27+16
.LPIC13:
	add	fp, pc, fp
	ldr	r9, .L27+20
.LPIC14:
	add	r10, pc, r10
	ldr	r2, .L27+24
.LPIC15:
	add	r4, pc, r4
	str	r3, [sp, #4]
.LPIC16:
	add	r9, pc, r9
	ldr	r3, .L27+28
	ldr	r8, [r7, r2]
.LPIC18:
	add	r3, pc, r3
	str	r3, [sp]
.L5:
	bl	print_menu(PLT)
	ldr	r0, [sp, #4]
	bl	printf(PLT)
	ldr	r2, [r8, #4]
	sub	r2, r2, #1
	str	r2, [r8, #4]
	cmp	r2, #0
	blt	.L24
	ldr	r2, [r8]
	add	r1, r2, #1
	str	r1, [r8]
	ldrb	r0, [r2]	@ zero_extendqisi2
.L7:
	sub	r2, r0, #49
	cmp	r2, #4
	addls	pc, pc, r2, asl #2
	b	.L8
.L10:
	b	.L9
	b	.L11
	b	.L12
	b	.L13
	b	.L21
.L21:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L13:
	ldr	r2, .L27+32
	mov	r1, #6
	ldr	r6, [r7, r2]
	ldr	r0, [r6]
	bl	ioctl(PLT)
.L15:
	mov	r0, fp
	add	r5, sp, #12
	bl	puts(PLT)
	mov	r0, r10
	bl	printf(PLT)
	mov	r1, r5
	mov	r0, r4
	bl	scanf(PLT)
	mov	r0, r9
	bl	printf(PLT)
	add	r1, sp, #13
	mov	r0, r4
	bl	scanf(PLT)
	ldr	r0, [sp]
	bl	printf(PLT)
	add	r1, sp, #14
	mov	r0, r4
	bl	scanf(PLT)
	mov	r0, #10
	bl	putchar(PLT)
	ldr	r2, [r8, #4]
	sub	r2, r2, #1
	str	r2, [r8, #4]
	cmp	r2, #0
	blt	.L25
	ldr	r2, [r8]
	add	r2, r2, #1
	str	r2, [r8]
.L18:
	ldr	r0, [r6]
	mov	r1, r5
	mov	r2, #3
	bl	write(PLT)
	b	.L5
.L12:
	ldr	r2, .L27+32
	mov	r1, #7
	ldr	r6, [r7, r2]
	ldr	r0, [r6]
	bl	ioctl(PLT)
	b	.L15
.L11:
	ldr	r2, .L27+32
	mov	r1, #8
	ldr	r6, [r7, r2]
	ldr	r0, [r6]
	bl	ioctl(PLT)
	b	.L15
.L9:
	ldr	r2, .L27+32
	mov	r1, #9
	ldr	r6, [r7, r2]
	ldr	r0, [r6]
	bl	ioctl(PLT)
	b	.L15
.L8:
	ldr	r0, .L27+36
.LPIC12:
	add	r0, pc, r0
	bl	printf(PLT)
	ldr	r2, [r8, #4]
	sub	r2, r2, #1
	str	r2, [r8, #4]
	cmp	r2, #0
	blt	.L26
	ldr	r2, [r8]
	add	r2, r2, #1
	str	r2, [r8]
	b	.L5
.L24:
	mov	r0, r8
	bl	__srget(PLT)
	uxtb	r0, r0
	b	.L7
.L26:
	mov	r0, r8
	bl	__srget(PLT)
	b	.L5
.L25:
	mov	r0, r8
	bl	__srget(PLT)
	b	.L18
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC11+8)
	.word	.LC8-(.LPIC10+8)
	.word	.LC10-(.LPIC13+8)
	.word	.LC11-(.LPIC14+8)
	.word	.LC12-(.LPIC15+8)
	.word	.LC13-(.LPIC16+8)
	.word	__sF(GOT)
	.word	.LC14-(.LPIC18+8)
	.word	fd(GOT)
	.word	.LC9-(.LPIC12+8)
	.size	ItemSelect, .-ItemSelect
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L32
	movw	r1, #4098
	stmfd	sp!, {r4, lr}
.LPIC20:
	add	r0, pc, r0
	bl	open(PLT)
	ldr	r3, .L32+4
	ldr	r2, .L32+8
.LPIC21:
	add	r3, pc, r3
	ldr	r4, [r3, r2]
	cmp	r0, #0
	str	r0, [r4]
	blt	.L31
	bl	ItemSelect(PLT)
	ldr	r0, [r4]
	bl	close(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L31:
	ldr	r0, .L32+12
.LPIC22:
	add	r0, pc, r0
	bl	perror(PLT)
	mov	r0, #1
	bl	exit(PLT)
.L33:
	.align	2
.L32:
	.word	.LC15-(.LPIC20+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC21+8)
	.word	fd(GOT)
	.word	.LC16-(.LPIC22+8)
	.size	main, .-main
	.comm	fd,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"==============================================\000"
	.space	1
.LC1:
	.ascii	"                Select Menu\000"
.LC2:
	.ascii	"----------------------------------------------\000"
	.space	1
.LC3:
	.ascii	"   1.   Led1    -[1]\000"
	.space	3
.LC4:
	.ascii	"   2.   Led2    -[2]\000"
	.space	3
.LC5:
	.ascii	"   3.   Led3    -[3]\000"
	.space	3
.LC6:
	.ascii	"   4.   Led4    -[4]\000"
	.space	3
.LC7:
	.ascii	"   5.   Quit    -[5]\000"
	.space	3
.LC8:
	.ascii	"\012Selected Item :  \000"
	.space	1
.LC9:
	.ascii	"\012No Test Menu Selected\000"
	.space	1
.LC10:
	.ascii	"\012input range 0 ~ 100 \000"
	.space	2
.LC11:
	.ascii	"\012input Red value : \000"
.LC12:
	.ascii	"%d\000"
	.space	1
.LC13:
	.ascii	"\012input Green value : \000"
	.space	2
.LC14:
	.ascii	"\012input Blue value : \000"
	.space	3
.LC15:
	.ascii	"/dev/sjl_fpgafullcolorled\000"
	.space	2
.LC16:
	.ascii	"/dev/sjl_fpgafullcolorled open fail\012\000"
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
