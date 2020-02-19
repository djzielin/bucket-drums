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
	.file	"/root/Bela/projects/bucket-drums/build/hit.bc"
	.globl	_ZN3hitC2EP11hit_manager
	.p2align	2
	.type	_ZN3hitC2EP11hit_manager,%function
_ZN3hitC2EP11hit_manager:               @ @_ZN3hitC2EP11hit_manager
	.fnstart
@ BB#0:
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	mov	r4, r0
	mov	r5, #0
	strb	r5, [r4]
	str	r5, [r4, #32]
	str	r1, [r4, #4]
	ldr	r0, [r1, #4]
	lsl	r1, r0, #1
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	str	r1, [r4, #12]
	bl	printf
	ldr	r0, [r4, #12]
	mov	r1, #4
	umull	r0, r1, r0, r1
	cmp	r1, #0
	movwne	r1, #1
	cmp	r1, #0
	mvnne	r0, #0
	bl	_Znaj
	vmov.i32	q8, #0x0
	str	r0, [r4, #8]
	add	r0, r4, #12
	str	r5, [r4, #36]
	strb	r5, [r4]
	str	r5, [r4, #32]
	vst1.32	{d16, d17}, [r0]
	ldr	r0, [r4, #4]
	ldr	r1, [r0]
	str	r1, [r4, #40]
	ldr	r0, [r0, #44]
	str	r0, [r4, #28]
	mov	r0, r4
	str	r1, [r4, #44]
	pop	{r4, r5, r11, pc}
.Lfunc_end0:
	.size	_ZN3hitC2EP11hit_manager, .Lfunc_end0-_ZN3hitC2EP11hit_manager
	.fnend

	.globl	_ZN3hit5resetEv
	.p2align	2
	.type	_ZN3hit5resetEv,%function
_ZN3hit5resetEv:                        @ @_ZN3hit5resetEv
	.fnstart
@ BB#0:
	mov	r1, #0
	vmov.i32	q8, #0x0
	str	r1, [r0, #36]
	strb	r1, [r0]
	str	r1, [r0, #32]
	add	r1, r0, #12
	vst1.32	{d16, d17}, [r1]
	ldr	r1, [r0, #4]
	ldr	r2, [r1]
	str	r2, [r0, #40]
	ldr	r1, [r1, #44]
	str	r1, [r0, #28]
	str	r2, [r0, #44]
	bx	lr
.Lfunc_end1:
	.size	_ZN3hit5resetEv, .Lfunc_end1-_ZN3hit5resetEv
	.fnend

	.globl	_ZN3hit10is_playingEv
	.p2align	2
	.type	_ZN3hit10is_playingEv,%function
_ZN3hit10is_playingEv:                  @ @_ZN3hit10is_playingEv
	.fnstart
@ BB#0:
	ldrb	r0, [r0]
	bx	lr
.Lfunc_end2:
	.size	_ZN3hit10is_playingEv, .Lfunc_end2-_ZN3hit10is_playingEv
	.fnend

	.globl	_ZN3hit10add_sampleEf
	.p2align	2
	.type	_ZN3hit10add_sampleEf,%function
_ZN3hit10add_sampleEf:                  @ @_ZN3hit10add_sampleEf
	.fnstart
@ BB#0:
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #8]
	add	r1, r1, r2, lsl #2
	vstr	s0, [r1]
	add	r1, r2, #1
	mov	r2, #1
	str	r1, [r0, #16]
	strb	r2, [r0]
	str	r1, [r0, #12]
	bx	lr
.Lfunc_end3:
	.size	_ZN3hit10add_sampleEf, .Lfunc_end3-_ZN3hit10add_sampleEf
	.fnend

	.globl	_ZN3hit18calc_normal_sampleEv
	.p2align	2
	.type	_ZN3hit18calc_normal_sampleEv,%function
_ZN3hit18calc_normal_sampleEv:          @ @_ZN3hit18calc_normal_sampleEv
	.fnstart
@ BB#0:
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.vsave	{d8, d9, d10}
	vpush	{d8, d9, d10}
	mov	r4, r0
	vmov.f32	d9, #1.000000e+00
	vldr	s16, [r4, #36]
	vldr	s20, [r4, #44]
	vmov.f32	s0, s16
	bl	floorf
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	ldr	r0, [r4, #8]
	vadd.f32	d1, d10, d8
	vsub.f32	d16, d8, d0
	vcvt.s32.f32	d0, d0
	vsub.f32	d17, d9, d16
	vmov	r1, s0
	add	r0, r0, r1, lsl #2
	vldr	s0, [r0]
	vldr	s4, [r0, #4]
	vmul.f32	d17, d0, d17
	vstr	s2, [r4, #36]
	vmul.f32	d16, d2, d16
	ldr	r5, [r4, #4]
	vldr	s0, [r5, #24]
	vadd.f32	d8, d16, d17
	vcmpe.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	beq	.LBB4_2
@ BB#1:
	ldr	r0, [r4, #20]
	vmov	s2, r0
	vcvt.f32.s32	d1, d1
	vdiv.f32	s0, s2, s0
	vneg.f32	d0, d0
	vcvt.f64.f32	d0, s0
	bl	__exp_finite
	vcvt.f32.f64	s0, d0
	vldr	s2, [r4, #40]
	vmul.f32	d1, d1, d0
	vstr	s2, [r4, #44]
	vldr	s0, [r5, #100]
	vcmpe.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	vstrlt	s0, [r4, #44]
.LBB4_2:
	vmov.f32	s0, s16
	vpop	{d8, d9, d10}
	pop	{r4, r5, r11, pc}
.Lfunc_end4:
	.size	_ZN3hit18calc_normal_sampleEv, .Lfunc_end4-_ZN3hit18calc_normal_sampleEv
	.fnend

	.globl	_ZN3hit4tickEv
	.p2align	2
	.type	_ZN3hit4tickEv,%function
_ZN3hit4tickEv:                         @ @_ZN3hit4tickEv
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.vsave	{d8, d9, d10}
	vpush	{d8, d9, d10}
	mov	r4, r0
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.LBB5_5
@ BB#1:
	ldr	r5, [r4, #4]
	ldr	r0, [r5, #48]
	cmp	r0, #0
	beq	.LBB5_8
@ BB#2:
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #28]
	cmp	r1, r2
	ble	.LBB5_8
@ BB#3:
	ldr	r3, [r4, #32]
	add	r6, r3, #1
	str	r6, [r4, #32]
	vldr	s0, [r5, #52]
	ldrh	r6, [r5, #60]
	vneg.f32	d1, d0
	tst	r6, #255
	vmoveq.f32	s0, s2
	vldr	s2, [r4, #40]
	cmp	r6, #256
	vadd.f32	d0, d1, d0
	vstr	s0, [r4, #40]
	vstr	s0, [r4, #44]
	vldr	s0, [r5, #56]
	bhs	.LBB5_6
@ BB#4:
	vmov.f32	d16, #2.000000e+00
	vsub.f32	d16, d16, d0
	vmov	s0, r2
	vcvt.f32.s32	d17, d0
	vmul.f32	d16, d17, d16
	b	.LBB5_7
.LBB5_5:
	vmov.i32	d0, #0x0
	b	.LBB5_16
.LBB5_6:
	vmov	s2, r2
	vcvt.f32.s32	d16, d1
	vmul.f32	d16, d16, d0
.LBB5_7:
	vcvt.s32.f32	d0, d16
	mov	r6, #0
	cmp	r3, r0
	vmov	r2, s0
	str	r2, [r4, #28]
	str	r6, [r4, #36]
	str	r6, [r4, #20]
	bge	.LBB5_13
.LBB5_8:
	ldr	r0, [r4, #12]
	vldr	s16, [r4, #36]
	vmov	s0, r0
	vcvt.f32.s32	d0, d0
	vcmpe.f32	s16, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB5_11
@ BB#9:
	mov	r6, r4
	movw	r0, :lower16:.L.str.3
	ldr	r1, [r6, #20]!
	movt	r0, :upper16:.L.str.3
	bl	rt_printf
	ldr	r5, [r6, #-16]
	ldr	r0, [r5, #48]
	cmp	r0, #0
	beq	.LBB5_14
@ BB#10:
	vmov.i32	d8, #0x0
	b	.LBB5_15
.LBB5_11:
	vmov.f32	s0, s16
	vldr	s20, [r4, #44]
	vmov.f32	d9, #1.000000e+00
	ldr	r6, [r4, #8]
	bl	floorf
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vadd.f32	d2, d10, d8
	vcvt.s32.f32	d1, d0
	vsub.f32	d16, d8, d0
	vmov	r0, s2
	vsub.f32	d17, d9, d16
	add	r0, r6, r0, lsl #2
	add	r6, r4, #20
	vldr	s0, [r0]
	vldr	s2, [r0, #4]
	vmul.f32	d17, d0, d17
	vstr	s4, [r4, #36]
	vmul.f32	d16, d1, d16
	vldr	s0, [r5, #24]
	vcmpe.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	vadd.f32	d8, d16, d17
	beq	.LBB5_15
@ BB#12:
	ldr	r0, [r4, #20]
	vmov	s2, r0
	vcvt.f32.s32	d1, d1
	vdiv.f32	s0, s2, s0
	vneg.f32	d0, d0
	vcvt.f64.f32	d0, s0
	bl	__exp_finite
	vcvt.f32.f64	s0, d0
	vldr	s2, [r4, #40]
	vmul.f32	d1, d1, d0
	vstr	s2, [r4, #44]
	vldr	s0, [r5, #100]
	vcmpe.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	vstrlt	s0, [r4, #44]
	b	.LBB5_15
.LBB5_13:                               @ %.critedge
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	rt_printf
	vmov.i32	d0, #0x0
	strb	r6, [r4]
	b	.LBB5_16
.LBB5_14:
	mov	r0, #0
	vmov.i32	d8, #0x0
	strb	r0, [r4]
.LBB5_15:                               @ %_ZN3hit18calc_normal_sampleEv.exit
	vldr	s0, [r5, #36]
	vmul.f32	d0, d0, d8
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	bl	_Z16distortion_clampf
	ldr	r0, [r4, #4]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	ldr	r1, [r6]
	vldr	s2, [r0, #40]
	add	r0, r1, #1
	str	r0, [r6]
	vmul.f32	d0, d1, d0
	ldr	r0, [r4, #24]
	add	r0, r0, #1
	str	r0, [r4, #24]
.LBB5_16:
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	vpop	{d8, d9, d10}
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end5:
	.size	_ZN3hit4tickEv, .Lfunc_end5-_ZN3hit4tickEv
	.fnend

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"  trying to allocate hit huffer: %d samples\n"
	.size	.L.str, 45

	.type	.L.str.2,%object        @ @.str.2
.L.str.2:
	.asciz	"inside stut code. done playing at sample: %d. stut length: %d\n"
	.size	.L.str.2, 63

	.type	.L.str.3,%object        @ @.str.3
.L.str.3:
	.asciz	"done playing at sample: %d\n"
	.size	.L.str.3, 28


	.globl	_ZN3hitC1EP11hit_manager
	.type	_ZN3hitC1EP11hit_manager,%function
_ZN3hitC1EP11hit_manager = _ZN3hitC2EP11hit_manager
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
