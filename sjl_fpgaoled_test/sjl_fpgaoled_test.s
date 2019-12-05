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
	.file	"sjl_fpgaoled_test.c"
	.text
	.align	2
	.global	PrintMenu
	.type	PrintMenu, %function
PrintMenu:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L2
	stmfd	sp!, {r4, lr}
.LPIC0:
	add	r0, pc, r0
	ldr	r4, .L2+4
	bl	puts(PLT)
	ldr	r0, .L2+8
.LPIC2:
	add	r4, pc, r4
.LPIC1:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r4
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
	ldr	r0, .L2+32
.LPIC8:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L2+36
.LPIC9:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
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
	.word	.LC8-(.LPIC8+8)
	.word	.LC9-(.LPIC9+8)
	.size	PrintMenu, .-PrintMenu
	.align	2
	.global	PrintRGB
	.type	PrintRGB, %function
PrintRGB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L5
	stmfd	sp!, {r3, lr}
.LPIC11:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L5+4
.LPIC12:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L5+8
.LPIC13:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L5+12
.LPIC14:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L5+16
	ldmfd	sp!, {r3, lr}
.LPIC15:
	add	r0, pc, r0
	b	puts(PLT)
.L6:
	.align	2
.L5:
	.word	.LC10-(.LPIC11+8)
	.word	.LC11-(.LPIC12+8)
	.word	.LC12-(.LPIC13+8)
	.word	.LC13-(.LPIC14+8)
	.word	.LC14-(.LPIC15+8)
	.size	PrintRGB, .-PrintRGB
	.align	2
	.global	getstring
	.type	getstring, %function
getstring:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #1
	bl	malloc(PLT)
	ldr	r5, .L15
.LPIC18:
	add	r5, pc, r5
	subs	r7, r0, #0
	beq	.L8
	ldr	r3, .L15+4
	mov	r6, #0
	mov	r4, r6
	mov	r8, #1
	ldr	r9, [r5, r3]
	b	.L9
.L11:
	strb	r5, [r7, r4]
	add	r6, r6, #2
	add	r4, r4, #1
.L9:
	mov	r0, r9
	bl	getc(PLT)
	uxtb	r5, r0
	cmp	r5, #10
	beq	.L14
	cmp	r4, r8
	bne	.L11
	mov	r0, r7
	mov	r1, r6
	bl	realloc(PLT)
	mov	r8, r6
	subs	r7, r0, #0
	bne	.L11
	ldr	r0, .L15+8
.LPIC17:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L14:
	mov	r3, #0
	strb	r3, [r7, r4]
.L10:
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L8:
	ldr	r0, .L15+12
.LPIC16:
	add	r0, pc, r0
	bl	puts(PLT)
	b	.L10
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC18+8)
	.word	__sF(GOT)
	.word	.LC16-(.LPIC17+8)
	.word	.LC15-(.LPIC16+8)
	.size	getstring, .-getstring
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L75
	mov	r1, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
.LPIC19:
	add	r0, pc, r0
	sub	sp, sp, #156
	ldr	r4, .L75+4
	bl	open(PLT)
.LPIC24:
	add	r4, pc, r4
	cmn	r0, #1
	mov	r7, r0
	beq	.L74
.L18:
	ldr	r3, .L75+8
	add	r6, sp, #40
	ldr	r2, .L75+12
	ldr	fp, .L75+16
.LPIC67:
	add	r2, pc, r2
	str	r2, [sp, #20]
	ldr	r2, .L75+20
.LPIC65:
	add	fp, pc, fp
	ldr	r5, [r4, r3]
	ldr	r3, .L75+24
.LPIC52:
	add	r2, pc, r2
	str	r2, [sp, #28]
.LPIC59:
	add	r3, pc, r3
	ldr	r2, .L75+28
	str	r3, [sp, #24]
	ldr	r3, .L75+32
.LPIC42:
	add	r2, pc, r2
	str	r2, [sp, #36]
.LPIC44:
	add	r3, pc, r3
	str	r3, [sp, #32]
.L71:
	bl	PrintMenu(PLT)
	ldr	r0, .L75+36
	add	r3, r5, #84
	mov	r1, #1
	mov	r2, #25
.LPIC23:
	add	r0, pc, r0
	bl	fwrite(PLT)
	mov	r1, #3
	mov	r2, r5
	mov	r0, r6
	bl	fgets(PLT)
	mov	r0, r6
	bl	atoi(PLT)
	ldr	r1, .L75+40
.LPIC25:
	add	r1, pc, r1
	mov	r4, r0
	mov	r0, r6
	bl	strcmp(PLT)
	cmp	r0, #0
	beq	.L73
	ldr	r0, .L75+44
	mov	r1, r4
.LPIC27:
	add	r0, pc, r0
	bl	printf(PLT)
	sub	r3, r4, #1
	cmp	r3, #6
	bhi	.L20
	sub	r4, r4, #2
	cmp	r4, #5
	addls	pc, pc, r4, asl #2
	b	.L21
.L23:
	b	.L22
	b	.L24
	b	.L25
	b	.L26
	b	.L27
	b	.L28
.L27:
	ldr	r0, .L75+48
	add	r4, sp, #48
.LPIC54:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L75+52
.LPIC55:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #10
	strlsh	r3, [sp, #76]	@ movhi
	bls	.L58
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #76]	@ movhi
.L58:
	ldr	r0, .L75+56
.LPIC56:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #10
	strlsh	r3, [sp, #78]	@ movhi
	bls	.L60
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #78]	@ movhi
.L60:
	ldr	r0, .L75+60
.LPIC57:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #10
	strlsh	r3, [sp, #80]	@ movhi
	bls	.L62
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #80]	@ movhi
.L62:
	bl	PrintRGB(PLT)
	ldr	r0, .L75+64
.LPIC58:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r2, r5
	mov	r1, #128
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	ldrls	r2, [sp, #24]
	ldmlsia	r2, {r0, r1}
	mov	r2, #16
	strls	r0, [r4]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	r1, [sp, #76]
	ldrh	r2, [sp, #78]
	ldrh	r3, [sp, #80]
	mov	ip, r0
	uxth	r0, r0
	str	r0, [sp]
	ldr	r0, .L75+68
	strh	ip, [sp, #82]	@ movhi
.LPIC60:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #22
	add	r2, sp, #76
	mov	r3, #1
	bl	ioctl(PLT)
	b	.L29
.L26:
	ldr	r0, .L75+72
	add	r4, sp, #48
.LPIC46:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L75+76
.LPIC47:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #64]	@ movhi
	bls	.L49
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #64]	@ movhi
.L49:
	ldr	r0, .L75+80
.LPIC48:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #66]	@ movhi
	bls	.L51
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #66]	@ movhi
.L51:
	ldr	r0, .L75+84
.LPIC49:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #40
	strlsh	r3, [sp, #68]	@ movhi
	bls	.L53
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #68]	@ movhi
.L53:
	ldr	r0, .L75+88
.LPIC50:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #40
	strlsh	r3, [sp, #70]	@ movhi
	bls	.L55
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #70]	@ movhi
.L55:
	bl	PrintRGB(PLT)
	ldr	r0, .L75+92
.LPIC51:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	mov	r2, #16
	cmp	r0, #1
	ldrls	r3, [sp, #28]
	ldmlsia	r3, {r0, r1}
	strls	r0, [r4]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	ip, [sp, #70]
	ldrh	r1, [sp, #64]
	ldrh	r2, [sp, #66]
	ldrh	r3, [sp, #68]
	str	ip, [sp]
	uxth	lr, r0
	strh	r0, [sp, #72]	@ movhi
	ldr	r0, .L75+96
	str	lr, [sp, #4]
.LPIC53:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #21
	add	r2, sp, #64
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L29
.L21:
	ldr	r0, .L75+100
.LPIC28:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r2, #0
	mov	r0, r7
	mov	r1, #17
	mov	r3, r2
	bl	ioctl(PLT)
.L29:
	movw	r0, #5000
	bl	usleep(PLT)
	b	.L71
.L24:
	ldr	r0, .L75+104
.LPIC35:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r2, #0
	mov	r0, r7
	mov	r1, #19
	mov	r3, r2
	bl	ioctl(PLT)
	b	.L29
.L22:
	ldr	r0, .L75+108
	add	r4, sp, #48
.LPIC29:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L75+112
.LPIC30:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #56]	@ movhi
	bls	.L31
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #56]	@ movhi
.L31:
	ldr	r0, .L75+116
.LPIC31:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #58]	@ movhi
	bls	.L33
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #58]	@ movhi
.L33:
	ldr	r0, .L75+120
.LPIC32:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #127
	strlsh	r3, [sp, #60]	@ movhi
	bls	.L35
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #60]	@ movhi
.L35:
	ldr	r0, .L75+124
.LPIC33:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #127
	strlsh	r3, [sp, #62]	@ movhi
	bls	.L37
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #62]	@ movhi
.L37:
	ldrh	ip, [sp, #62]
	ldr	r0, .L75+128
	ldrh	r1, [sp, #56]
	ldrh	r2, [sp, #58]
.LPIC34:
	add	r0, pc, r0
	ldrh	r3, [sp, #60]
	str	ip, [sp]
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #18
	add	r2, sp, #56
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L29
.L25:
	ldr	r0, .L75+132
	add	r4, sp, #48
.LPIC36:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L75+136
.LPIC37:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #20
	strlsh	r3, [sp, #88]	@ movhi
	bls	.L39
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #88]	@ movhi
.L39:
	ldr	r0, .L75+140
.LPIC38:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #20
	strlsh	r3, [sp, #90]	@ movhi
	bls	.L41
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #90]	@ movhi
.L41:
	ldr	r0, .L75+144
.LPIC39:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #40
	strlsh	r3, [sp, #92]	@ movhi
	bls	.L43
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #92]	@ movhi
.L43:
	ldr	r0, .L75+148
.LPIC40:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #40
	strlsh	r3, [sp, #94]	@ movhi
	bls	.L45
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #94]	@ movhi
.L45:
	bl	PrintRGB(PLT)
	ldr	r0, .L75+152
.LPIC41:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	mov	r2, #16
	cmp	r0, #1
	ldrls	r3, [sp, #36]
	ldmlsia	r3, {r0, r1}
	strls	r0, [r4]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	strh	r0, [sp, #96]	@ movhi
	ldr	r0, .L75+156
.LPIC43:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r2, r5
	mov	r1, #128
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	ldrls	r2, [sp, #32]
	ldmlsia	r2, {r0, r1}
	mov	r2, #16
	strls	r0, [r4]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	lr, [sp, #94]
	ldrh	r1, [sp, #88]
	ldrh	r2, [sp, #90]
	ldrh	r3, [sp, #92]
	str	lr, [sp]
	uxth	ip, r0
	str	ip, [sp, #8]
	ldrh	ip, [sp, #96]
	strh	r0, [sp, #98]	@ movhi
	ldr	r0, .L75+160
	str	ip, [sp, #4]
.LPIC45:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #20
	add	r2, sp, #88
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L29
.L20:
	ldr	r0, .L75+164
.LPIC69:
	add	r0, pc, r0
	bl	puts(PLT)
	b	.L29
.L73:
	ldr	r0, .L75+168
.LPIC26:
	add	r0, pc, r0
	bl	puts(PLT)
	mvn	r0, #0
	add	sp, sp, #156
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L28:
	ldr	r0, .L75+172
	add	r4, sp, #48
.LPIC61:
	add	r0, pc, r0
	bl	printf(PLT)
	ldr	r0, .L75+176
.LPIC62:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #124]	@ movhi
	bls	.L65
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #124]	@ movhi
.L65:
	ldr	r0, .L75+180
.LPIC63:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	cmp	r0, #1
	movls	r3, #0
	strlsh	r3, [sp, #126]	@ movhi
	bls	.L67
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #126]	@ movhi
.L67:
	ldr	r0, .L75+184
	mov	r3, #0
	str	r3, [sp, #128]
	add	r8, sp, #100
.LPIC64:
	add	r0, pc, r0
	str	r3, [sp, #132]
	str	r3, [sp, #136]
	add	r9, sp, #124
	str	r3, [sp, #140]
	add	r10, sp, #128
	str	r3, [sp, #144]
	strb	r3, [sp, #148]
	bl	printf(PLT)
	bl	getstring(PLT)
	mov	r1, r0
	mov	r0, r8
	bl	strcpy(PLT)
	mov	r0, r8
	bl	strlen(PLT)
	cmp	r0, #1
	addls	r0, r9, #4
	movhi	r2, r0
	movls	r1, fp
	movls	r2, #22
	movhi	r1, r8
	addhi	r0, r9, #4
	bl	strncpy(PLT)
	bl	PrintRGB(PLT)
	ldr	r0, .L75+188
.LPIC66:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r1, #128
	mov	r2, r5
	mov	r0, r4
	bl	fgets(PLT)
	mov	r0, r4
	bl	strlen(PLT)
	mov	r2, #16
	cmp	r0, #1
	ldrls	r3, [sp, #20]
	ldmlsia	r3, {r0, r1}
	strls	r0, [r4]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	r1, [sp, #124]
	ldrh	r2, [sp, #126]
	mov	r3, r10
	mov	ip, r0
	uxth	r0, r0
	str	r0, [sp]
	ldr	r0, .L75+192
	strh	ip, [sp, #150]	@ movhi
.LPIC68:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r2, r9
	mov	r1, #23
	mov	r3, #28
	bl	ioctl(PLT)
	b	.L29
.L74:
	ldr	r0, .L75+196
	mov	r1, #129
	ldr	r2, .L75+200
	ldr	r3, .L75+204
.LPIC20:
	add	r0, pc, r0
.LPIC21:
	add	r2, pc, r2
.LPIC22:
	add	r3, pc, r3
	bl	__assert2(PLT)
	b	.L18
.L76:
	.align	2
.L75:
	.word	.LC17-(.LPIC19+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC24+8)
	.word	__sF(GOT)
	.word	.LC36-(.LPIC67+8)
	.word	.LC51-(.LPIC65+8)
	.word	.LC41-(.LPIC52+8)
	.word	.LC36-(.LPIC59+8)
	.word	.LC36-(.LPIC42+8)
	.word	.LC38-(.LPIC44+8)
	.word	.LC20-(.LPIC23+8)
	.word	.LC21-(.LPIC25+8)
	.word	.LC23-(.LPIC27+8)
	.word	.LC43-(.LPIC54+8)
	.word	.LC44-(.LPIC55+8)
	.word	.LC45-(.LPIC56+8)
	.word	.LC46-(.LPIC57+8)
	.word	.LC35-(.LPIC58+8)
	.word	.LC47-(.LPIC60+8)
	.word	.LC40-(.LPIC46+8)
	.word	.LC26-(.LPIC47+8)
	.word	.LC27-(.LPIC48+8)
	.word	.LC28-(.LPIC49+8)
	.word	.LC29-(.LPIC50+8)
	.word	.LC35-(.LPIC51+8)
	.word	.LC42-(.LPIC53+8)
	.word	.LC24-(.LPIC28+8)
	.word	.LC31-(.LPIC35+8)
	.word	.LC25-(.LPIC29+8)
	.word	.LC26-(.LPIC30+8)
	.word	.LC27-(.LPIC31+8)
	.word	.LC28-(.LPIC32+8)
	.word	.LC29-(.LPIC33+8)
	.word	.LC30-(.LPIC34+8)
	.word	.LC32-(.LPIC36+8)
	.word	.LC26-(.LPIC37+8)
	.word	.LC27-(.LPIC38+8)
	.word	.LC33-(.LPIC39+8)
	.word	.LC34-(.LPIC40+8)
	.word	.LC35-(.LPIC41+8)
	.word	.LC37-(.LPIC43+8)
	.word	.LC39-(.LPIC45+8)
	.word	.LC54-(.LPIC69+8)
	.word	.LC22-(.LPIC26+8)
	.word	.LC48-(.LPIC61+8)
	.word	.LC26-(.LPIC62+8)
	.word	.LC49-(.LPIC63+8)
	.word	.LC50-(.LPIC64+8)
	.word	.LC52-(.LPIC66+8)
	.word	.LC53-(.LPIC68+8)
	.word	.LC18-(.LPIC20+8)
	.word	.LANCHOR0-(.LPIC21+8)
	.word	.LC19-(.LPIC22+8)
	.size	main, .-main
	.comm	IOCTL_CMD,4,4
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.5544, %object
	.size	__PRETTY_FUNCTION__.5544, 5
__PRETTY_FUNCTION__.5544:
	.ascii	"main\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\012 ______________________\012\000"
	.space	2
.LC1:
	.ascii	"   <OLED Draw Example>\000"
	.space	1
.LC2:
	.ascii	" ______________________\012\000"
	.space	3
.LC3:
	.ascii	" 1. MENU print\000"
	.space	1
.LC4:
	.ascii	" 2. CLEAR Window\000"
	.space	3
.LC5:
	.ascii	" 3. Image draw\000"
	.space	1
.LC6:
	.ascii	" 4. Rect draw\000"
	.space	2
.LC7:
	.ascii	" 5. Line draw\000"
	.space	2
.LC8:
	.ascii	" 6. Circle draw\000"
.LC9:
	.ascii	" 7. Text Print\000"
	.space	1
.LC10:
	.ascii	"\012     - RGB Value --------------------\000"
	.space	1
.LC11:
	.ascii	"     BLACK : 0x0000\011WHITE : 0xFFFF\000"
	.space	1
.LC12:
	.ascii	"     RED   : 0xF800\011GREEN : 0x07E0\000"
	.space	1
.LC13:
	.ascii	"     BLUE  : 0x001F\011YELLOW: 0xFFE0\000"
	.space	1
.LC14:
	.ascii	"     ---------------------------------\000"
	.space	1
.LC15:
	.ascii	"\012\012Can not allocate sufficent memory\012\000"
	.space	3
.LC16:
	.ascii	"\012can not allocat sufficiant memory\000"
	.space	1
.LC17:
	.ascii	"/dev/sjl_fpgaoled\000"
	.space	2
.LC18:
	.ascii	"sjl_fpgaoled_test.c\000"
.LC19:
	.ascii	"fd != -1\000"
	.space	3
.LC20:
	.ascii	"Select Number (Quit:q) > \000"
	.space	2
.LC21:
	.ascii	"q\012\000"
	.space	1
.LC22:
	.ascii	"\012Program EXIT !!!\012\000"
	.space	1
.LC23:
	.ascii	"cmd : %x\012\012\000"
	.space	1
.LC24:
	.ascii	"  - 1. MENU print\000"
	.space	2
.LC25:
	.ascii	"  - 2. CLEAR Window\000"
.LC26:
	.ascii	"    > Input Start X point(0~127) : \000"
.LC27:
	.ascii	"    > Input Start Y point(0~127) : \000"
.LC28:
	.ascii	"    > Input End X point(0~127) : \000"
	.space	2
.LC29:
	.ascii	"    > Input End Y point(0~127) : \000"
	.space	2
.LC30:
	.ascii	"    : %d %d %d %d\012\000"
	.space	1
.LC31:
	.ascii	"  - 3. Image draw\000"
	.space	2
.LC32:
	.ascii	"  - 4. Rect draw\000"
	.space	3
.LC33:
	.ascii	"    > Input END X point(0~127) : \000"
	.space	2
.LC34:
	.ascii	"    > Input END Y point(0~127) : \000"
	.space	2
.LC35:
	.ascii	"    > Input In-Color RGB Value(0x----) : \000"
	.space	2
.LC36:
	.ascii	"FFFF\000"
	.space	3
.LC37:
	.ascii	"    > Input out-Color RGB Value(0x----) : \000"
	.space	1
.LC38:
	.ascii	"001F\000"
	.space	3
.LC39:
	.ascii	"    : %d %d %d %d %x %x\012\000"
	.space	3
.LC40:
	.ascii	"  - 5. Line draw\000"
	.space	3
.LC41:
	.ascii	"07E0\000"
	.space	3
.LC42:
	.ascii	"    : %d %d %d %d %x\012\000"
	.space	2
.LC43:
	.ascii	"  - 6. Circle draw\000"
	.space	1
.LC44:
	.ascii	"    > Input Center X point(0~127) : \000"
	.space	3
.LC45:
	.ascii	"    > Input Center Y point(0~127) : \000"
	.space	3
.LC46:
	.ascii	"    > Input Radius point : \000"
.LC47:
	.ascii	"    : %d %d %d %x \012\000"
.LC48:
	.ascii	"  - 7. Text Print %d\012\000"
	.space	2
.LC49:
	.ascii	"    > Input Start Y point(0~128) : \000"
.LC50:
	.ascii	"    > Input Text(0~21) : \000"
	.space	2
.LC51:
	.ascii	"<SM5 OLED> HANBACK\000"
	.space	1
.LC52:
	.ascii	"    > Input Color RGB Value(0x----) : \000"
	.space	1
.LC53:
	.ascii	"    : %d %d %s %x\012\000"
	.space	1
.LC54:
	.ascii	"\012<Warning> Invalid Number.. retry!!\000"
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
