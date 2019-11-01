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
	.file	"testOLed.c"
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
.LPIC15:
	add	r0, pc, r0
	ldmfd	sp!, {r3, lr}
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r0, #1
	bl	malloc(PLT)
	ldr	r5, .L16
.LPIC18:
	add	r5, pc, r5
	subs	r7, r0, #0
	beq	.L14
	ldr	r3, .L16+4
	mov	r6, #0
	mov	r4, r6
	mov	r8, #1
	ldr	sl, [r5, r3]
	b	.L8
.L10:
	strb	r5, [r7, r4]
	add	r6, r6, #2
	add	r4, r4, #1
.L8:
	mov	r0, sl
	bl	getc(PLT)
	uxtb	r5, r0
	cmp	r5, #10
	beq	.L15
	cmp	r4, r8
	bne	.L10
	mov	r0, r7
	mov	r1, r6
	bl	realloc(PLT)
	mov	r8, r6
	subs	r7, r0, #0
	bne	.L10
	ldr	r0, .L16+8
.LPIC17:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
.L15:
	mov	r3, #0
	strb	r3, [r7, r4]
.L9:
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
.L14:
	ldr	r0, .L16+12
.LPIC16:
	add	r0, pc, r0
	bl	puts(PLT)
	b	.L9
.L17:
	.align	2
.L16:
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
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L78
	mov	r1, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LPIC19:
	add	r0, pc, r0
	sub	sp, sp, #140
	ldr	r4, .L78+4
	bl	open(PLT)
.LPIC24:
	add	r4, pc, r4
	cmn	r0, #1
	mov	r7, r0
	beq	.L74
	ldr	r3, .L78+8
	add	r6, sp, #24
	ldr	r5, [r4, r3]
.L72:
	ldr	fp, .L78+12
	ldr	r8, .L78+16
	ldr	r9, .L78+20
.LPIC67:
	add	fp, pc, fp
	ldr	sl, .L78+24
.LPIC65:
	add	r8, pc, r8
	ldr	r3, .L78+28
.LPIC59:
	add	r9, pc, r9
.LPIC52:
	add	sl, pc, sl
.LPIC44:
	add	r3, pc, r3
	str	r3, [sp, #16]
	ldr	r3, .L78+32
.LPIC42:
	add	r3, pc, r3
	str	r3, [sp, #20]
.L76:
	bl	PrintMenu(PLT)
	ldr	r0, .L78+36
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
	ldr	r1, .L78+40
.LPIC25:
	add	r1, pc, r1
	mov	r4, r0
	mov	r0, r6
	bl	strcmp(PLT)
	cmp	r0, #0
	beq	.L77
	ldr	r0, .L78+44
	mov	r1, r4
.LPIC27:
	add	r0, pc, r0
	bl	printf(PLT)
	sub	r3, r4, #1
	cmp	r3, #6
	bhi	.L21
	sub	r4, r4, #2
	cmp	r4, #5
	addls	pc, pc, r4, asl #2
	b	.L22
.L29:
	b	.L23
	b	.L24
	b	.L25
	b	.L26
	b	.L27
	b	.L28
.L27:
	ldr	r0, .L78+48
	add	r4, sp, #32
.LPIC54:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L78+52
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
	strlsh	r3, [sp, #60]	@ movhi
	bls	.L59
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #60]	@ movhi
.L59:
	ldr	r0, .L78+56
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
	strlsh	r3, [sp, #62]	@ movhi
	bls	.L61
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #62]	@ movhi
.L61:
	ldr	r0, .L78+60
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
	strlsh	r3, [sp, #64]	@ movhi
	bls	.L63
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #64]	@ movhi
.L63:
	bl	PrintRGB(PLT)
	ldr	r0, .L78+64
.LPIC58:
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
	ldmlsia	r9, {r0, r1}
	strls	r0, [r4, #0]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	r1, [sp, #60]
	ldrh	r2, [sp, #62]
	ldrh	r3, [sp, #64]
	mov	ip, r0
	uxth	r0, r0
	str	r0, [sp, #0]
	ldr	r0, .L78+68
	strh	ip, [sp, #66]	@ movhi
.LPIC60:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #22
	add	r2, sp, #60
	mov	r3, #1
	bl	ioctl(PLT)
	b	.L30
.L26:
	ldr	r0, .L78+72
	add	r4, sp, #32
.LPIC46:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L78+76
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
	strlsh	r3, [sp, #48]	@ movhi
	bls	.L50
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #48]	@ movhi
.L50:
	ldr	r0, .L78+80
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
	strlsh	r3, [sp, #50]	@ movhi
	bls	.L52
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #50]	@ movhi
.L52:
	ldr	r0, .L78+84
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
	strlsh	r3, [sp, #52]	@ movhi
	bls	.L54
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #52]	@ movhi
.L54:
	ldr	r0, .L78+88
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
	strlsh	r3, [sp, #54]	@ movhi
	bls	.L56
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #54]	@ movhi
.L56:
	bl	PrintRGB(PLT)
	ldr	r0, .L78+92
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
	ldmlsia	sl, {r0, r1}
	strls	r0, [r4, #0]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	ip, [sp, #54]
	ldrh	r1, [sp, #48]
	ldrh	r2, [sp, #50]
	ldrh	r3, [sp, #52]
	str	ip, [sp, #0]
	uxth	lr, r0
	strh	r0, [sp, #56]	@ movhi
	ldr	r0, .L78+96
	str	lr, [sp, #4]
.LPIC53:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #21
	add	r2, sp, #48
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L30
.L22:
	ldr	r0, .L78+100
.LPIC28:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r2, #0
	mov	r0, r7
	mov	r1, #17
	mov	r3, r2
	bl	ioctl(PLT)
.L30:
	movw	r0, #5000
	bl	usleep(PLT)
	b	.L76
.L24:
	ldr	r0, .L78+104
.LPIC35:
	add	r0, pc, r0
	bl	puts(PLT)
	mov	r2, #0
	mov	r0, r7
	mov	r1, #19
	mov	r3, r2
	bl	ioctl(PLT)
	b	.L30
.L23:
	ldr	r0, .L78+108
	add	r4, sp, #32
.LPIC29:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L78+112
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
	strlsh	r3, [sp, #40]	@ movhi
	bls	.L32
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #40]	@ movhi
.L32:
	ldr	r0, .L78+116
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
	strlsh	r3, [sp, #42]	@ movhi
	bls	.L34
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #42]	@ movhi
.L34:
	ldr	r0, .L78+120
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
	strlsh	r3, [sp, #44]	@ movhi
	bls	.L36
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #44]	@ movhi
.L36:
	ldr	r0, .L78+124
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
	strlsh	r3, [sp, #46]	@ movhi
	bls	.L38
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #46]	@ movhi
.L38:
	ldrh	ip, [sp, #46]
	ldr	r0, .L78+128
	ldrh	r1, [sp, #40]
	ldrh	r2, [sp, #42]
.LPIC34:
	add	r0, pc, r0
	ldrh	r3, [sp, #44]
	str	ip, [sp, #0]
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #18
	add	r2, sp, #40
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L30
.L25:
	ldr	r0, .L78+132
	add	r4, sp, #32
.LPIC36:
	add	r0, pc, r0
	bl	puts(PLT)
	ldr	r0, .L78+136
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
	strlsh	r3, [sp, #72]	@ movhi
	bls	.L40
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #72]	@ movhi
.L40:
	ldr	r0, .L78+140
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
	strlsh	r3, [sp, #74]	@ movhi
	bls	.L42
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #74]	@ movhi
.L42:
	ldr	r0, .L78+144
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
	strlsh	r3, [sp, #76]	@ movhi
	bls	.L44
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #76]	@ movhi
.L44:
	ldr	r0, .L78+148
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
	strlsh	r3, [sp, #78]	@ movhi
	bls	.L46
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #78]	@ movhi
.L46:
	bl	PrintRGB(PLT)
	ldr	r0, .L78+152
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
	ldrls	r3, [sp, #20]
	ldmlsia	r3, {r0, r1}
	strls	r0, [r4, #0]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	strh	r0, [sp, #80]	@ movhi
	ldr	r0, .L78+156
.LPIC43:
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
	ldrls	r3, [sp, #16]
	ldmlsia	r3, {r0, r1}
	strls	r0, [r4, #0]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	lr, [sp, #78]
	ldrh	r1, [sp, #72]
	ldrh	r2, [sp, #74]
	ldrh	r3, [sp, #76]
	str	lr, [sp, #0]
	uxth	ip, r0
	str	ip, [sp, #8]
	ldrh	ip, [sp, #80]
	strh	r0, [sp, #82]	@ movhi
	ldr	r0, .L78+160
	str	ip, [sp, #4]
.LPIC45:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	mov	r1, #20
	add	r2, sp, #72
	mov	r3, #0
	bl	ioctl(PLT)
	b	.L30
.L28:
	ldr	r0, .L78+164
	add	r4, sp, #32
.LPIC61:
	add	r0, pc, r0
	bl	printf(PLT)
	ldr	r0, .L78+168
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
	strlsh	r3, [sp, #108]	@ movhi
	bls	.L66
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #108]	@ movhi
.L66:
	ldr	r0, .L78+172
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
	strlsh	r3, [sp, #110]	@ movhi
	bls	.L68
	mov	r0, r4
	bl	atoi(PLT)
	strh	r0, [sp, #110]	@ movhi
.L68:
	ldr	r0, .L78+176
	mov	r3, #0
	str	r3, [sp, #112]
.LPIC64:
	add	r0, pc, r0
	str	r3, [sp, #116]
	str	r3, [sp, #120]
	str	r3, [sp, #124]
	str	r3, [sp, #128]
	strb	r3, [sp, #132]
	bl	printf(PLT)
	bl	getstring(PLT)
	mov	r1, r0
	add	r0, sp, #84
	bl	strcpy(PLT)
	add	r0, sp, #84
	bl	strlen(PLT)
	cmp	r0, #1
	addhi	r1, sp, #84
	addls	r0, sp, #112
	movhi	r2, r0
	movls	r1, r8
	movls	r2, #22
	addhi	r0, sp, #112
	bl	strncpy(PLT)
	bl	PrintRGB(PLT)
	ldr	r0, .L78+180
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
	ldmlsia	fp, {r0, r1}
	strls	r0, [r4, #0]
	mov	r0, r4
	strlsb	r1, [r4, #4]
	mov	r1, #0
	bl	strtol(PLT)
	ldrh	r1, [sp, #108]
	ldrh	r2, [sp, #110]
	add	r3, sp, #112
	mov	ip, r0
	uxth	r0, r0
	str	r0, [sp, #0]
	ldr	r0, .L78+184
	strh	ip, [sp, #134]	@ movhi
.LPIC68:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, r7
	add	r2, sp, #108
	mov	r1, #23
	mov	r3, #28
	bl	ioctl(PLT)
	b	.L30
.L21:
	ldr	r0, .L78+188
.LPIC69:
	add	r0, pc, r0
	bl	puts(PLT)
	b	.L30
.L77:
	ldr	r0, .L78+192
.LPIC26:
	add	r0, pc, r0
	bl	puts(PLT)
	mvn	r0, #0
	add	sp, sp, #140
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L74:
	ldr	r0, .L78+196
	mov	r1, #129
	ldr	r2, .L78+200
	add	r6, sp, #24
	ldr	r3, .L78+204
.LPIC20:
	add	r0, pc, r0
.LPIC21:
	add	r2, pc, r2
.LPIC22:
	add	r3, pc, r3
	bl	__assert2(PLT)
	ldr	r3, .L78+8
	ldr	r5, [r4, r3]
	b	.L72
.L79:
	.align	2
.L78:
	.word	.LC17-(.LPIC19+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC24+8)
	.word	__sF(GOT)
	.word	.LC36-(.LPIC67+8)
	.word	.LC51-(.LPIC65+8)
	.word	.LC36-(.LPIC59+8)
	.word	.LC41-(.LPIC52+8)
	.word	.LC38-(.LPIC44+8)
	.word	.LC36-(.LPIC42+8)
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
	.word	.LC48-(.LPIC61+8)
	.word	.LC26-(.LPIC62+8)
	.word	.LC49-(.LPIC63+8)
	.word	.LC50-(.LPIC64+8)
	.word	.LC52-(.LPIC66+8)
	.word	.LC53-(.LPIC68+8)
	.word	.LC54-(.LPIC69+8)
	.word	.LC22-(.LPIC26+8)
	.word	.LC18-(.LPIC20+8)
	.word	.LANCHOR0-(.LPIC21+8)
	.word	.LC19-(.LPIC22+8)
	.size	main, .-main
	.comm	IOCTL_CMD,4,4
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__PRETTY_FUNCTION__.5538, %object
	.size	__PRETTY_FUNCTION__.5538, 5
__PRETTY_FUNCTION__.5538:
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
	.ascii	"/dev/fpga_oled\000"
	.space	1
.LC18:
	.ascii	"testOLed.c\000"
	.space	1
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
	.ident	"GCC: (GNU) 4.7"
	.section	.note.GNU-stack,"",%progbits
