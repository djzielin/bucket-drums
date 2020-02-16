	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a8
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	neon
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute	23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.eabi_attribute	68, 1	@ Tag_Virtualization_use
	.file	"/root/Bela/projects/bucket-drums/build/tapped_delay_line.bc"
	.globl	_ZN17tapped_delay_lineC2Effi
	.p2align	2
	.type	_ZN17tapped_delay_lineC2Effi,%function
_ZN17tapped_delay_lineC2Effi:           @ @_ZN17tapped_delay_lineC2Effi
	.fnstart
@ BB#0:                                 @ %_ZN17tapped_delay_line14set_delay_timeEf.exit
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.vsave	{d8, d9}
	vpush	{d8, d9}
	vmov.f32	s18, s1
	mov	r4, r0
	movw	r0, :lower16:.L.str
	mov	r5, r1
	movt	r0, :upper16:.L.str
	vmov.f64	d8, d0
	vcvt.f64.f32	d16, s18
	vmov	r2, r3, d16
	bl	printf
	mov	r6, #4
	mov	r2, #0
	umull	r0, r1, r5, r6
	str	r2, [r4, #20]
	vstr	s16, [r4, #16]
	str	r5, [r4, #4]
	cmp	r1, #0
	movwne	r1, #1
	cmp	r1, #0
	mvnne	r0, #0
	bl	_Znaj
	vmul.f32	d16, d8, d9
	str	r0, [r4, #12]
	vcvt.u32.f32	d0, d16
	vmov	r5, s0
	cmp	r5, #0
	movweq	r5, #1
	umull	r1, r2, r5, r6
	str	r5, [r4]
	cmp	r2, #0
	movwne	r2, #1
	cmp	r2, #0
	mvnne	r1, #0
	mov	r0, r1
	bl	_Znaj
	str	r0, [r4, #8]
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	mov	r1, r5
	bl	printf
	ldr	r1, [r4]
	cmp	r1, #0
	beq	.LBB0_2
@ BB#1:                                 @ %.lr.ph
	ldr	r0, [r4, #8]
	lsl	r2, r1, #2
	mov	r1, #0
	bl	memset
.LBB0_2:                                @ %._crit_edge
	movw	r0, :lower16:.Lstr
	movt	r0, :upper16:.Lstr
	bl	puts
	mov	r0, r4
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end0:
	.size	_ZN17tapped_delay_lineC2Effi, .Lfunc_end0-_ZN17tapped_delay_lineC2Effi
	.fnend

	.globl	_ZN17tapped_delay_line14set_delay_timeEf
	.p2align	2
	.type	_ZN17tapped_delay_line14set_delay_timeEf,%function
_ZN17tapped_delay_line14set_delay_timeEf: @ @_ZN17tapped_delay_line14set_delay_timeEf
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	mov	r5, r0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s2, [r5, #16]
	ldr	r0, [r5]
	vmul.f32	d16, d1, d0
	vcvt.u32.f32	d0, d16
	vmov	r4, s0
	cmp	r4, #0
	movweq	r4, #1
	cmp	r0, #0
	beq	.LBB1_3
@ BB#1:
	movw	r0, :lower16:.Lstr.1
	movt	r0, :upper16:.Lstr.1
	bl	puts
	mov	r6, r5
	ldr	r0, [r6, #8]!
	cmp	r0, #0
	beq	.LBB1_4
@ BB#2:
	bl	_ZdlPv
	b	.LBB1_4
.LBB1_3:                                @ %._crit_edge
	add	r6, r5, #8
.LBB1_4:
	mov	r0, #4
	str	r4, [r5]
	umull	r0, r1, r4, r0
	cmp	r1, #0
	movwne	r1, #1
	cmp	r1, #0
	mvnne	r0, #0
	bl	_Znaj
	str	r0, [r6]
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	mov	r1, r4
	bl	printf
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end1:
	.size	_ZN17tapped_delay_line14set_delay_timeEf, .Lfunc_end1-_ZN17tapped_delay_line14set_delay_timeEf
	.fnend

	.globl	_Z7isPrimei
	.p2align	2
	.type	_Z7isPrimei,%function
_Z7isPrimei:                            @ @_Z7isPrimei
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	mov	r4, r0
	mov	r0, #1
	cmp	r4, #4
	poplt	{r4, r5, r6, r10, r11, pc}
	add	r0, r4, r4, lsr #31
	mov	r5, #1
	asr	r6, r0, #1
.LBB2_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	add	r5, r5, #1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_idivmod
	mov	r0, #0
	cmp	r1, #0
	beq	.LBB2_3
@ BB#2:                                 @   in Loop: Header=BB2_1 Depth=1
	mov	r0, #1
	cmp	r5, r6
	blt	.LBB2_1
.LBB2_3:                                @ %._crit_edge
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end2:
	.size	_Z7isPrimei, .Lfunc_end2-_Z7isPrimei
	.fnend

	.globl	_ZN17tapped_delay_line12set_tap_timeEfi
	.p2align	2
	.type	_ZN17tapped_delay_line12set_tap_timeEfi,%function
_ZN17tapped_delay_line12set_tap_timeEfi: @ @_ZN17tapped_delay_line12set_tap_timeEfi
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	mov	r5, r0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	mov	r4, r1
	vldr	s2, [r5, #16]
	ldr	r0, [r5]
	vmul.f32	d16, d1, d0
	vcvt.u32.f32	d1, d16
	vmov	r6, s2
	cmp	r6, r0
	bls	.LBB3_2
@ BB#1:
	vcvt.f64.f32	d16, s0
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	vmov	r2, r3, d16
	bl	printf
	pop	{r4, r5, r6, r10, r11, pc}
.LBB3_2:
	movw	r0, :lower16:.L.str.3
	mov	r1, r4
	movt	r0, :upper16:.L.str.3
	mov	r2, r6
	bl	printf
	ldr	r0, [r5, #12]
	str	r6, [r0, r4, lsl #2]
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end3:
	.size	_ZN17tapped_delay_line12set_tap_timeEfi, .Lfunc_end3-_ZN17tapped_delay_line12set_tap_timeEfi
	.fnend

	.globl	_ZN17tapped_delay_line4tickEf
	.p2align	2
	.type	_ZN17tapped_delay_line4tickEf,%function
_ZN17tapped_delay_line4tickEf:          @ @_ZN17tapped_delay_line4tickEf
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.setfp	r11, sp, #28
	add	r11, sp, #28
	.pad	#4
	sub	sp, sp, #4
	.vsave	{d8, d9}
	vpush	{d8, d9}
	.pad	#8
	sub	sp, sp, #8
	vmov.f32	s16, s0
	mov	r9, r0
	ldr	r6, [r9, #4]
	vmov.i32	d9, #0x0
	ldr	r7, [r9, #20]
	cmp	r6, #0
	beq	.LBB4_4
@ BB#1:                                 @ %.lr.ph
	ldr	r5, [r9]
	mov	r8, #0
	ldr	r10, [r9, #8]
	ldr	r4, [r9, #12]
	str	r7, [sp, #4]            @ 4-byte Spill
	add	r7, r5, r7
.LBB4_2:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, r8, lsl #2]
	mov	r1, r5
	sub	r0, r7, r0
	bl	__aeabi_uidivmod
	add	r0, r10, r1, lsl #2
	add	r8, r8, #1
	cmp	r8, r6
	vldr	s0, [r0]
	vadd.f32	d9, d0, d9
	blo	.LBB4_2
@ BB#3:
	ldr	r7, [sp, #4]            @ 4-byte Reload
	b	.LBB4_5
.LBB4_4:                                @ %.._crit_edge_crit_edge
	ldr	r5, [r9]
	ldr	r10, [r9, #8]
.LBB4_5:                                @ %._crit_edge
	add	r0, r7, #1
	mov	r1, r5
	bl	__aeabi_uidivmod
	add	r0, r10, r7, lsl #2
	vmov.f32	s0, s18
	vstr	s16, [r0]
	str	r1, [r9, #20]
	sub	sp, r11, #48
	vpop	{d8, d9}
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end4:
	.size	_ZN17tapped_delay_line4tickEf, .Lfunc_end4-_ZN17tapped_delay_line4tickEf
	.fnend

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"initializing taped delay line: max %f seconds\n"
	.size	.L.str, 47

	.type	.L.str.2,%object        @ @.str.2
.L.str.2:
	.asciz	"error: tap time of %f is too long!\n"
	.size	.L.str.2, 36

	.type	.L.str.3,%object        @ @.str.3
.L.str.3:
	.asciz	"setting tap %d to: %d samples\n"
	.size	.L.str.3, 31

	.type	.L.str.5,%object        @ @.str.5
.L.str.5:
	.asciz	"   current delay is now: %d samples\n"
	.size	.L.str.5, 37

	.type	.Lstr,%object           @ @str
.Lstr:
	.asciz	"   DONE!"
	.size	.Lstr, 9

	.type	.Lstr.1,%object         @ @str.1
	.section	.rodata.str1.16,"aMS",%progbits,1
	.p2align	4
.Lstr.1:
	.asciz	"delay line already exists, to removing old one first!"
	.size	.Lstr.1, 54


	.globl	_ZN17tapped_delay_lineC1Effi
	.type	_ZN17tapped_delay_lineC1Effi,%function
_ZN17tapped_delay_lineC1Effi = _ZN17tapped_delay_lineC2Effi
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
