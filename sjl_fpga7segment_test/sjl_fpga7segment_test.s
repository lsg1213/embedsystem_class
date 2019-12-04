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
	.file	"sjl_fpga7segment_test.c"
	.text
	.align	2
	.global	init_keyboard
	.type	init_keyboard, %function
init_keyboard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	movw	r1, #21505
	ldr	r5, .L2
	mov	r0, #0
	mov	r6, #0
	mvn	r8, #8
.LPIC0:
	add	r5, pc, r5
	mov	r7, #1
	mov	r2, r5
	mov	r4, r5
	bl	ioctl(PLT)
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, r5, #36
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	str	r8, [r5, #48]
	ldr	r4, [r4]
	stmia	ip!, {r0, r1, r2, r3}
	add	r2, r5, #36
	mov	r0, r6
	str	r4, [ip]
	strb	r7, [r5, #59]
	movw	r1, #21506
	strb	r6, [r5, #58]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	ioctl(PLT)
.L3:
	.align	2
.L2:
	.word	.LANCHOR0-(.LPIC0+8)
	.size	init_keyboard, .-init_keyboard
	.align	2
	.global	close_keyboard
	.type	close_keyboard, %function
close_keyboard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L5
	mov	r0, #0
	movw	r1, #21506
.LPIC7:
	add	r2, pc, r2
	b	ioctl(PLT)
.L6:
	.align	2
.L5:
	.word	.LANCHOR0-(.LPIC7+8)
	.size	close_keyboard, .-close_keyboard
	.align	2
	.global	kbhit
	.type	kbhit, %function
kbhit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #8
	ldr	r4, .L14
.LPIC8:
	add	r4, pc, r4
	ldr	r3, [r4]
	cmn	r3, #1
	movne	r0, #1
	beq	.L13
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L13:
	ldr	r6, .L14+4
	mov	r5, #0
	mov	r0, r5
	movw	r1, #21506
.LPIC9:
	add	r6, pc, r6
	add	r7, r6, #36
	strb	r5, [r6, #59]
	mov	r2, r7
	bl	ioctl(PLT)
	add	r1, sp, #7
	mov	r0, r5
	mov	r2, #1
	bl	read(PLT)
	mov	r2, r7
	movw	r1, #21506
	mov	r3, #1
	strb	r3, [r6, #59]
	mov	r8, r0
	mov	r0, r5
	bl	ioctl(PLT)
	cmp	r8, #1
	ldreqb	r3, [sp, #7]	@ zero_extendqisi2
	moveq	r0, r8
	movne	r0, r5
	streq	r3, [r4]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L15:
	.align	2
.L14:
	.word	.LANCHOR1-(.LPIC8+8)
	.word	.LANCHOR0-(.LPIC9+8)
	.size	kbhit, .-kbhit
	.align	2
	.global	readch
	.type	readch, %function
readch:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	str	lr, [sp, #-4]!
.LPIC14:
	add	r3, pc, r3
	sub	sp, sp, #12
	ldr	r0, [r3]
	cmn	r0, #1
	beq	.L17
	uxtb	r0, r0
	mvn	r2, #0
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L17:
	add	r1, sp, #7
	mov	r2, #1
	mov	r0, #0
	bl	read(PLT)
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L20:
	.align	2
.L19:
	.word	.LANCHOR1-(.LPIC14+8)
	.size	readch, .-readch
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L80
	movw	r1, #4098
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #44
.LPIC16:
	add	r0, pc, r0
	mov	r5, #1
	str	r5, [sp, #20]
	bl	open(PLT)
	subs	r4, r0, #0
	blt	.L77
	ldr	r5, .L80+4
	bl	init_keyboard(PLT)
	ldr	r3, .L80+8
.LPIC18:
	add	r5, pc, r5
	ldr	r9, .L80+12
.LPIC36:
	add	r3, pc, r3
	str	r3, [sp]
	mov	r0, r5
	ldr	fp, .L80+16
	bl	puts(PLT)
	ldr	r0, .L80+20
.LPIC33:
	add	r9, pc, r9
.LPIC34:
	add	fp, pc, fp
.LPIC19:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L80+24
.LPIC21:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+28
.LPIC22:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+32
.LPIC23:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L80+36
	mov	r1, #0
	ldr	r3, .L80+40
.LPIC25:
	add	r0, pc, r0
	mov	r2, r1
.LPIC37:
	add	r3, pc, r3
	str	r3, [sp, #4]
	bl	printf(PLT)
	ldr	r3, .L80+44
.LPIC38:
	add	r3, pc, r3
	str	r3, [sp, #8]
	ldr	r3, .L80+48
.LPIC39:
	add	r3, pc, r3
	str	r3, [sp, #12]
.L24:
	bl	kbhit(PLT)
	cmp	r0, #0
	beq	.L24
	bl	readch(PLT)
	cmp	r0, #113
	mov	r7, r0
	beq	.L23
	cmp	r0, #116
	beq	.L26
	cmp	r0, #99
	bne	.L24
	ldr	r0, .L80+52
	add	r6, sp, #40
	ldr	r5, .L80+56
.LPIC40:
	add	r0, pc, r0
	bl	printf(PLT)
.LPIC42:
	add	r5, pc, r5
	bl	close_keyboard(PLT)
	ldr	r0, .L80+60
	add	r1, sp, #20
.LPIC41:
	add	r0, pc, r0
	bl	scanf(PLT)
	bl	init_keyboard(PLT)
	ldr	r3, [sp, #20]
	mov	r0, r5
	str	r3, [r6, #-16]!
	bl	puts(PLT)
	ldr	r0, .L80+64
.LPIC43:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L80+68
.LPIC45:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+72
.LPIC46:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+76
.LPIC47:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+80
.LPIC48:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	mov	r1, #0
	mov	r0, r4
	mov	r2, r1
	mov	r3, r1
	bl	ioctl(PLT)
.L50:
	cmp	r7, #99
	beq	.L73
	cmp	r7, #114
	beq	.L71
	cmp	r7, #112
	beq	.L74
.L33:
	bl	kbhit(PLT)
	cmp	r0, #0
	bne	.L78
.L35:
	cmp	r7, #113
	bne	.L50
.L30:
	ldr	r5, .L80+84
.LPIC26:
	add	r5, pc, r5
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L80+88
.LPIC27:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	ldr	r0, .L80+92
.LPIC29:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+96
.LPIC30:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L80+100
.LPIC31:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	puts(PLT)
	b	.L24
.L36:
	mov	r7, #99
.L73:
	ldr	r3, [sp, #24]
	cmp	r3, #0
	ble	.L30
	mov	r5, #14
.L32:
	mov	r0, r4
	mov	r1, r6
	mov	r2, #4
	bl	write(PLT)
	subs	r5, r5, #1
	bne	.L32
	ldr	r3, [sp, #24]
	sub	r3, r3, #1
	str	r3, [sp, #24]
	bl	kbhit(PLT)
	cmp	r0, #0
	beq	.L35
.L78:
	bl	readch(PLT)
	sub	r0, r0, #99
	cmp	r0, #15
	addls	pc, pc, r0, asl #2
	b	.L35
.L37:
	b	.L36
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L35
	b	.L54
	b	.L30
	b	.L71
.L71:
	ldr	r3, [sp, #20]
	mov	r7, #99
	str	r3, [sp, #24]
	b	.L33
.L54:
	mov	r7, #112
.L74:
	mov	r0, r4
	mov	r1, r6
	mov	r2, #4
	bl	write(PLT)
	b	.L33
.L23:
	mov	r0, #0
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L26:
	mov	r0, r9
	add	r7, sp, #28
	bl	puts(PLT)
	mov	r0, fp
	bl	puts(PLT)
	mov	r0, r9
	bl	puts(PLT)
	ldr	r0, [sp]
	bl	puts(PLT)
	ldr	r0, [sp, #4]
	bl	puts(PLT)
	ldr	r0, [sp, #8]
	bl	puts(PLT)
	ldr	r0, [sp, #12]
	bl	puts(PLT)
	mov	r2, #0
	mov	r0, r4
	mov	r1, #1
	mov	r3, r2
	add	r6, sp, #32
	bl	ioctl(PLT)
	mov	r5, #99
	movw	r10, #10000
	mov	r8, #100
.L49:
	cmp	r5, #99
	beq	.L79
.L43:
	cmp	r5, #112
	beq	.L75
.L44:
	bl	kbhit(PLT)
	cmp	r0, #0
	beq	.L49
	bl	readch(PLT)
	cmp	r0, #112
	beq	.L55
	cmp	r0, #113
	beq	.L24
	cmp	r0, #99
	moveq	r5, #99
	cmp	r5, #99
	bne	.L43
.L79:
	mov	r1, #0
	mov	r0, r6
	bl	gettimeofday(PLT)
	mov	r0, r6
	bl	localtime(PLT)
	mov	r3, r0
	ldr	r1, [r0, #4]
	ldr	r2, [r3, #8]
	mov	r0, r4
	ldr	ip, [r3]
	mul	r3, r8, r1
	mov	r1, r7
	mla	r3, r10, r2, r3
	mov	r2, #4
	add	r3, r3, ip
	str	r3, [sp, #28]
	bl	write(PLT)
	b	.L44
.L55:
	mov	r5, r0
.L75:
	mov	r0, r4
	mov	r1, r7
	mov	r2, #4
	bl	write(PLT)
	b	.L44
.L77:
	ldr	r0, .L80+104
.LPIC17:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r5
	bl	exit(PLT)
.L81:
	.align	2
.L80:
	.word	.LC0-(.LPIC16+8)
	.word	.LC2-(.LPIC18+8)
	.word	.LC10-(.LPIC36+8)
	.word	.LC8-(.LPIC33+8)
	.word	.LC9-(.LPIC34+8)
	.word	.LC3-(.LPIC19+8)
	.word	.LC4-(.LPIC21+8)
	.word	.LC5-(.LPIC22+8)
	.word	.LC6-(.LPIC23+8)
	.word	.LC7-(.LPIC25+8)
	.word	.LC11-(.LPIC37+8)
	.word	.LC6-(.LPIC38+8)
	.word	.LC12-(.LPIC39+8)
	.word	.LC13-(.LPIC40+8)
	.word	.LC2-(.LPIC42+8)
	.word	.LC14-(.LPIC41+8)
	.word	.LC15-(.LPIC43+8)
	.word	.LC11-(.LPIC45+8)
	.word	.LC10-(.LPIC46+8)
	.word	.LC16-(.LPIC47+8)
	.word	.LC6-(.LPIC48+8)
	.word	.LC2-(.LPIC26+8)
	.word	.LC3-(.LPIC27+8)
	.word	.LC4-(.LPIC29+8)
	.word	.LC5-(.LPIC30+8)
	.word	.LC6-(.LPIC31+8)
	.word	.LC1-(.LPIC17+8)
	.size	main, .-main
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	peek_character, %object
	.size	peek_character, 4
peek_character:
	.word	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/dev/sjl_fpga7segment\000"
	.space	2
.LC1:
	.ascii	"FND open fail\000"
	.space	2
.LC2:
	.ascii	"-------------------------------\000"
.LC3:
	.ascii	"   7Segment Program\000"
.LC4:
	.ascii	"   [c] counter\000"
	.space	1
.LC5:
	.ascii	"   [t] system time\000"
	.space	1
.LC6:
	.ascii	"   [q] exit\000"
.LC7:
	.ascii	"input %d %c\012\000"
	.space	3
.LC8:
	.ascii	" -------------------------------------\000"
	.space	1
.LC9:
	.ascii	"   System Time\000"
	.space	1
.LC10:
	.ascii	"   [c] continue\000"
.LC11:
	.ascii	"   [p] pause\000"
	.space	3
.LC12:
	.ascii	" -----------------------------------\012\000"
	.space	2
.LC13:
	.ascii	"input counter value (0:exit program, 99~01) : \000"
	.space	1
.LC14:
	.ascii	"%d\000"
	.space	1
.LC15:
	.ascii	"   Counter\000"
	.space	1
.LC16:
	.ascii	"   [r] reset\000"
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	initial_settings, %object
	.size	initial_settings, 36
initial_settings:
	.space	36
	.type	new_settings, %object
	.size	new_settings, 36
new_settings:
	.space	36
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
