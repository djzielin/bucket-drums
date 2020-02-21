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
	.file	"/root/Bela/projects/bucket-drums/build/render.bc"
	.globl	_Z17calc_cycle_lengthi
	.p2align	3
	.type	_Z17calc_cycle_lengthi,%function
_Z17calc_cycle_lengthi:                 @ @_Z17calc_cycle_lengthi
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vmov	s2, r0
	vldr	s0, .LCPI0_0
	vcvt.f32.s32	d16, d1
	vldr	s2, .LCPI0_1
	vadd.f32	d16, d16, d0
	vmul.f32	d0, d16, d1
	vcvt.f64.f32	d0, s0
	bl	exp2
	vldr	d16, .LCPI0_2
	vldr	s2, .LCPI0_3
	vmul.f64	d16, d0, d16
	vcvt.f32.f64	s0, d16
	vdiv.f32	s0, s2, s0
	pop	{r11, pc}
	.p2align	3
@ BB#1:
.LCPI0_2:
	.long	0                       @ double 440
	.long	1081835520
.LCPI0_0:
	.long	3263823872              @ float -69
.LCPI0_1:
	.long	1034594987              @ float 0.0833333358
.LCPI0_3:
	.long	1194083328              @ float 44100
.Lfunc_end0:
	.size	_Z17calc_cycle_lengthi, .Lfunc_end0-_Z17calc_cycle_lengthi
	.fnend

	.globl	_Z8cc_writehh
	.p2align	2
	.type	_Z8cc_writehh,%function
_Z8cc_writehh:                          @ @_Z8cc_writehh
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#8
	sub	sp, sp, #8
	mov	r2, #176
	strb	r2, [r11, #-3]
	mov	r2, #3
	strb	r0, [r11, #-2]
	movw	r0, :lower16:midi
	strb	r1, [r11, #-1]
	sub	r1, r11, #3
	movt	r0, :upper16:midi
	bl	_ZN4Midi11writeOutputEPhj
	mov	sp, r11
	pop	{r11, pc}
.Lfunc_end1:
	.size	_Z8cc_writehh, .Lfunc_end1-_Z8cc_writehh
	.fnend

	.globl	_Z13sysexCallbackPSt6vectorIhSaIhEE
	.p2align	2
	.type	_Z13sysexCallbackPSt6vectorIhSaIhEE,%function
_Z13sysexCallbackPSt6vectorIhSaIhEE:    @ @_Z13sysexCallbackPSt6vectorIhSaIhEE
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	mov	r4, r0
	ldm	r4, {r0, r1}
	sub	r1, r1, r0
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	rt_printf
	ldr	r0, [r4]
	ldrb	r1, [r0, #6]
	cmp	r1, #95
	ldrbeq	r1, [r0, #7]
	cmpeq	r1, #79
	bne	.LBB2_2
@ BB#1:
	ldrb	r0, [r0, #8]
	add	r1, r0, #1
	movw	r0, :lower16:.L.str.3
	movt	r0, :upper16:.L.str.3
	bl	rt_printf
	ldr	r0, [r4]
.LBB2_2:                                @ %.preheader
	ldr	r1, [r4, #4]
	sub	r1, r1, r0
	cmp	r1, #7
	blo	.LBB2_5
@ BB#3:                                 @ %.lr.ph.preheader
	movw	r5, :lower16:.L.str.4
	mov	r6, #6
	movt	r5, :upper16:.L.str.4
.LBB2_4:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r1, [r0, r6]
	mov	r0, r5
	bl	rt_printf
	ldm	r4, {r0, r1}
	add	r6, r6, #1
	sub	r1, r1, r0
	cmp	r6, r1
	blo	.LBB2_4
.LBB2_5:                                @ %._crit_edge
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	bl	rt_printf
	pop	{r4, r5, r6, r10, r11, pc}
.Lfunc_end2:
	.size	_Z13sysexCallbackPSt6vectorIhSaIhEE, .Lfunc_end2-_Z13sysexCallbackPSt6vectorIhSaIhEE
	.fnend

	.globl	_Z15process_midi_ccii
	.p2align	2
	.type	_Z15process_midi_ccii,%function
_Z15process_midi_ccii:                  @ @_Z15process_midi_ccii
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.vsave	{d8, d9}
	vpush	{d8, d9}
	mov	r4, r1
	mov	r5, r0
	movw	r0, :lower16:.L.str.6
	mov	r1, r5
	movt	r0, :upper16:.L.str.6
	mov	r2, r4
	bl	rt_printf
	vmov	s2, r4
	sub	r0, r5, #1
	vcvt.f32.s32	d16, d1
	vldr	s0, .LCPI3_3
	cmp	r0, #37
	bhi	.LBB3_14
@ BB#1:
	adr	r1, .LJTI3_0
	lsl	r0, r0, #2
	vmul.f32	d8, d16, d0
	ldr	pc, [r0, r1]
@ BB#2:
	.p2align	2
.LJTI3_0:
	.long	.LBB3_3
	.long	.LBB3_4
	.long	.LBB3_6
	.long	.LBB3_7
	.long	.LBB3_8
	.long	.LBB3_10
	.long	.LBB3_11
	.long	.LBB3_12
	.long	.LBB3_13
	.long	.LBB3_14
	.long	.LBB3_15
	.long	.LBB3_16
	.long	.LBB3_18
	.long	.LBB3_19
	.long	.LBB3_20
	.long	.LBB3_22
	.long	.LBB3_23
	.long	.LBB3_24
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_25
	.long	.LBB3_26
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_28
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_29
	.long	.LBB3_30
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_32
	.long	.LBB3_14
	.long	.LBB3_14
	.long	.LBB3_33
.LBB3_3:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.7
	movt	r0, :upper16:.L.str.7
	mov	r1, #1
	vmov	r2, r3, d16
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #12]
	b	.LBB3_5
.LBB3_4:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	mov	r1, #2
	vmov	r2, r3, d16
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #16]
.LBB3_5:
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager14set_base_pitchEf
.LBB3_6:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.9
	movt	r0, :upper16:.L.str.9
	mov	r1, #3
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager13set_gate_timeEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager13set_gate_timeEf
.LBB3_7:
	vcvt.f64.f32	d9, s16
	movw	r0, :lower16:.L.str.10
	movt	r0, :upper16:.L.str.10
	mov	r1, #4
	vmov	r2, r3, d9
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager15set_stut_lengthEf
	vmov.f32	s0, s16
	ldr	r0, [r4, #16]
	bl	_ZN11hit_manager15set_stut_lengthEf
	b	.LBB3_9
.LBB3_8:                                @ %._crit_edge
	vcvt.f64.f32	d9, s16
.LBB3_9:
	vmov	r2, r3, d9
	movw	r0, :lower16:.L.str.11
	movt	r0, :upper16:.L.str.11
	mov	r1, r5
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager18set_stut_pitch_modEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager18set_stut_pitch_modEf
.LBB3_10:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.12
	movt	r0, :upper16:.L.str.12
	mov	r1, #6
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager16set_delay_lengthEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager16set_delay_lengthEf
.LBB3_11:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.13
	movt	r0, :upper16:.L.str.13
	mov	r1, #7
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager14set_delay_pmodEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager14set_delay_pmodEf
.LBB3_12:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.14
	movt	r0, :upper16:.L.str.14
	mov	r1, #8
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	d1, #1.000000e+00
	movw	r0, :lower16:.L_MergedGlobals
	vmov.f32	s0, s16
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r4, [r0, #4]
	vmov.f32	s1, s2
	ldr	r0, [r0, #12]
	vmov.f32	d1, #1.000000e+01
	bl	_ZN11hit_manager12map_to_rangeEfff
	mov	r0, r4
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN8freeverb15set_delay_timesEf
.LBB3_13:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.15
	movt	r0, :upper16:.L.str.15
	mov	r1, #9
	vmov	r2, r3, d16
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	vstr	s16, [r0, #8]
.LBB3_14:
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, pc}
.LBB3_15:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.16
	movt	r0, :upper16:.L.str.16
	mov	r1, #11
	vmov	r2, r3, d16
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #12]
	b	.LBB3_17
.LBB3_16:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.17
	movt	r0, :upper16:.L.str.17
	mov	r1, #12
	vmov	r2, r3, d16
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #16]
.LBB3_17:
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager17set_hit_thresholdEf
.LBB3_18:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.18
	movt	r0, :upper16:.L.str.18
	mov	r1, #13
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager9set_boostEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager9set_boostEf
.LBB3_19:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.19
	movt	r0, :upper16:.L.str.19
	mov	r1, #14
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager18set_stut_max_countEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager18set_stut_max_countEf
.LBB3_20:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.20
	movt	r0, :upper16:.L.str.20
	mov	r1, #15
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager19set_stut_length_modEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager19set_stut_length_modEf
	.p2align	2
@ BB#21:
.LCPI3_3:
	.long	1006699012              @ float 0.00787401571
.LBB3_22:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.21
	movt	r0, :upper16:.L.str.21
	mov	r1, #16
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager15set_delay_countEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager15set_delay_countEf
.LBB3_23:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.22
	movt	r0, :upper16:.L.str.22
	mov	r1, #17
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r4, :lower16:.L_MergedGlobals
	movt	r4, :upper16:.L_MergedGlobals
	ldr	r0, [r4, #12]
	bl	_ZN11hit_manager14set_delay_smodEf
	ldr	r0, [r4, #16]
	vmov.f32	s0, s16
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager14set_delay_smodEf
.LBB3_24:
	vcvt.f64.f32	d16, s16
	movw	r0, :lower16:.L.str.23
	movt	r0, :upper16:.L.str.23
	mov	r1, #18
	vmov	r2, r3, d16
	bl	rt_printf
	vmov.f32	s0, s16
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	vmov.f32	d1, #1.000000e+00
	ldr	r4, [r0, #4]
	ldr	r0, [r0, #12]
	vldr	s1, .LCPI3_1
	bl	_ZN11hit_manager12map_to_rangeEfff
	mov	r0, r4
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN8freeverb12set_feedbackEf
.LBB3_25:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #21
	moveq	r2, r0
	movw	r0, :lower16:.L.str.24
	movt	r0, :upper16:.L.str.24
	bl	rt_printf
	vmov.f32	d1, #5.000000e-01
	cmp	r4, #127
	vmov.i32	d0, #0x0
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	vmoveq.f32	s0, s2
	ldr	r0, [r0, #12]
	b	.LBB3_27
.LBB3_26:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #22
	moveq	r2, r0
	movw	r0, :lower16:.L.str.24
	movt	r0, :upper16:.L.str.24
	bl	rt_printf
	vmov.f32	d1, #5.000000e-01
	movw	r0, :lower16:.L_MergedGlobals
	movt	r0, :upper16:.L_MergedGlobals
	vmov.i32	d0, #0x0
	cmp	r4, #127
	ldr	r0, [r0, #16]
	vmoveq.f32	s0, s2
.LBB3_27:
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager14set_pitch_bendEf
.LBB3_28:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #25
	moveq	r2, r0
	movw	r0, :lower16:.L.str.27
	movt	r0, :upper16:.L.str.27
	bl	rt_printf
	movw	r6, :lower16:.L_MergedGlobals
	mov	r5, #0
	movt	r6, :upper16:.L_MergedGlobals
	cmp	r4, #127
	ldr	r0, [r6, #12]
	movweq	r5, #1
	mov	r1, r5
	bl	_ZN11hit_manager23set_stut_lmod_up_buttonEb
	ldr	r0, [r6, #16]
	mov	r1, r5
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager23set_stut_lmod_up_buttonEb
.LBB3_29:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #31
	moveq	r2, r0
	movw	r0, :lower16:.L.str.28
	movt	r0, :upper16:.L.str.28
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	mov	r1, #0
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #12]
	b	.LBB3_31
.LBB3_30:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #32
	moveq	r2, r0
	movw	r0, :lower16:.L.str.29
	movt	r0, :upper16:.L.str.29
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	mov	r1, #0
	movt	r0, :upper16:.L_MergedGlobals
	ldr	r0, [r0, #16]
.LBB3_31:
	cmp	r4, #127
	movweq	r1, #1
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager11set_bend_upEb
.LBB3_32:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #35
	moveq	r2, r0
	movw	r0, :lower16:.L.str.30
	movt	r0, :upper16:.L.str.30
	bl	rt_printf
	movw	r6, :lower16:.L_MergedGlobals
	mov	r5, #0
	movt	r6, :upper16:.L_MergedGlobals
	cmp	r4, #127
	ldr	r0, [r6, #12]
	movweq	r5, #1
	mov	r1, r5
	bl	_ZN11hit_manager23set_stut_pmod_up_buttonEb
	ldr	r0, [r6, #16]
	mov	r1, r5
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN11hit_manager23set_stut_pmod_up_buttonEb
.LBB3_33:
	movw	r0, :lower16:.L.str.25
	movw	r2, :lower16:.L.str.26
	movt	r0, :upper16:.L.str.25
	movt	r2, :upper16:.L.str.26
	cmp	r4, #127
	mov	r1, #38
	moveq	r2, r0
	movw	r0, :lower16:.L.str.31
	movt	r0, :upper16:.L.str.31
	bl	rt_printf
	movw	r0, :lower16:.L_MergedGlobals
	mov	r1, #0
	movt	r0, :upper16:.L_MergedGlobals
	cmp	r4, #127
	ldr	r0, [r0, #4]
	movweq	r1, #1
	vpop	{d8, d9}
	pop	{r4, r5, r6, r10, r11, lr}
	b	_ZN8freeverb8set_holdEb
	.p2align	2
@ BB#34:
.LCPI3_1:
	.long	1062668861              @ float 0.839999973
.Lfunc_end3:
	.size	_Z15process_midi_ccii, .Lfunc_end3-_Z15process_midi_ccii
	.fnend

	.globl	_Z19midiMessageCallback18MidiChannelMessagePv
	.p2align	2
	.type	_Z19midiMessageCallback18MidiChannelMessagePv,%function
_Z19midiMessageCallback18MidiChannelMessagePv: @ @_Z19midiMessageCallback18MidiChannelMessagePv
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	mov	r4, r0
	bl	_ZN18MidiChannelMessage7getTypeEv
	cmp	r0, #3
	bne	.LBB4_2
@ BB#1:
	ldrb	r0, [r4, #5]
	ldrb	r1, [r4, #6]
	bl	_Z15process_midi_ccii
.LBB4_2:
	mov	r0, r4
	bl	_ZN18MidiChannelMessage7getTypeEv
	cmp	r0, #7
	popne	{r4, r10, r11, pc}
	movw	r0, :lower16:.L.str.32
	movt	r0, :upper16:.L.str.32
	bl	rt_printf
	pop	{r4, r10, r11, pc}
.Lfunc_end4:
	.size	_Z19midiMessageCallback18MidiChannelMessagePv, .Lfunc_end4-_Z19midiMessageCallback18MidiChannelMessagePv
	.fnend

	.globl	_Z11zero_all_ccv
	.p2align	2
	.type	_Z11zero_all_ccv,%function
_Z11zero_all_ccv:                       @ @_Z11zero_all_ccv
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	mov	r4, #0
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	mov	r1, #0
	bl	_Z15process_midi_ccii
	add	r4, r4, #1
	cmp	r4, #40
	bne	.LBB5_1
@ BB#2:
	pop	{r4, r10, r11, pc}
.Lfunc_end5:
	.size	_Z11zero_all_ccv, .Lfunc_end5-_Z11zero_all_ccv
	.fnend

	.globl	setup
	.p2align	2
	.type	setup,%function
setup:                                  @ @setup
.Lfunc_begin0:
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r7, r8, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r10, r11, lr}
	.setfp	r11, sp, #24
	add	r11, sp, #24
	.pad	#8
	sub	sp, sp, #8
	movw	r6, :lower16:.L_MergedGlobals
	movw	r5, :lower16:midi
	movt	r6, :upper16:.L_MergedGlobals
	movt	r5, :upper16:midi
	ldr	r1, [r6, #20]
	mov	r8, r0
	mov	r0, r5
	bl	_ZN4Midi8readFromEPKc
	ldr	r1, [r6, #20]
	mov	r0, r5
	bl	_ZN4Midi7writeToEPKc
	mov	r0, r5
	mov	r1, #1
	mov	r7, #1
	bl	_ZN4Midi12enableParserEb
	mov	r0, r5
	mov	r1, #1
	ldr	r4, [r6, #20]
	bl	_ZN4Midi12enableParserEb
	mov	r0, r5
	bl	_ZN4Midi9getParserEv
	movw	r1, :lower16:_Z19midiMessageCallback18MidiChannelMessagePv
	str	r4, [r0, #36]
	movt	r1, :upper16:_Z19midiMessageCallback18MidiChannelMessagePv
	mov	r2, #3
	str	r1, [r0, #28]
	add	r1, sp, #5
	strb	r7, [r0, #32]
	movw	r0, #5552
	strh	r0, [sp, #5]
	mov	r0, #127
	strb	r0, [sp, #7]
	mov	r0, r5
	bl	_ZN4Midi11writeOutputEPhj
	vldr	s0, [r8, #32]
	movw	r0, :lower16:.L.str.33
	movt	r0, :upper16:.L.str.33
	vcvt.u32.f32	d0, d0
	vmov	r1, s0
	str	r1, [r6]
	bl	rt_printf
	movw	r0, :lower16:.Lstr
	movt	r0, :upper16:.Lstr
	bl	puts
	mov	r0, #104
	bl	_Znwj
	mov	r5, r0
	ldr	r0, [r6]
	vldr	s1, .LCPI6_0
	vmov	s2, r0
	vcvt.f32.u32	d1, d1
.Ltmp0:
	vmov.f32	s0, s2
	mov	r0, r5
	bl	_ZN11hit_managerC1Eff
.Ltmp1:
@ BB#1:
	mov	r0, #1069547520
	mov	r7, #0
	str	r0, [r5, #84]
	movw	r0, :lower16:.Lstr.1
	movt	r0, :upper16:.Lstr.1
	str	r5, [r6, #12]
	str	r7, [r5, #100]
	bl	puts
	mov	r0, #104
	bl	_Znwj
	mov	r5, r0
	ldr	r0, [r6]
	vldr	s1, .LCPI6_0
	vmov	s2, r0
	vcvt.f32.u32	d1, d1
.Ltmp3:
	vmov.f32	s0, s2
	mov	r0, r5
	bl	_ZN11hit_managerC1Eff
.Ltmp4:
@ BB#2:
	mov	r0, #1073741824
	str	r5, [r6, #16]
	str	r0, [r5, #84]
	mov	r0, #120
	str	r7, [r5, #100]
	bl	_Znwj
	mov	r5, r0
	ldr	r0, [r6]
	vmov	s0, r0
	vcvt.f32.u32	d0, d0
.Ltmp6:
	mov	r0, r5
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	bl	_ZN8freeverbC1Ef
.Ltmp7:
@ BB#3:
	str	r5, [r6, #4]
	movw	r0, :lower16:scope
	vldr	s0, [r8, #32]
	movt	r0, :upper16:scope
	mov	r1, #4
	bl	_ZN5Scope5setupEjf
	mov	r4, #0
.LBB6_4:                                @ =>This Inner Loop Header: Depth=1
	mov	r0, r4
	mov	r1, #0
	bl	_Z15process_midi_ccii
	add	r4, r4, #1
	cmp	r4, #40
	bne	.LBB6_4
@ BB#5:                                 @ %_Z11zero_all_ccv.exit
	movw	r0, :lower16:.L.str.36
	movt	r0, :upper16:.L.str.36
	bl	rt_printf
	mov	r0, #1
	sub	sp, r11, #24
	pop	{r4, r5, r6, r7, r8, r10, r11, pc}
.LBB6_6:
.Ltmp8:
	b	.LBB6_9
.LBB6_7:
.Ltmp5:
	b	.LBB6_9
.LBB6_8:
.Ltmp2:
.LBB6_9:
	mov	r4, r0
	mov	r0, r5
	bl	_ZdlPv
	mov	r0, r4
	mov	lr, pc
	b	_Unwind_Resume
	.p2align	2
@ BB#10:
.LCPI6_0:
	.long	1148846080              @ float 1000
.Lfunc_end6:
	.size	setup, .Lfunc_end6-setup
	.globl	__gxx_personality_v0
	.personality __gxx_personality_v0
	.handlerdata
	.p2align	2
GCC_except_table6:
.Lexception0:
	.byte	255                     @ @LPStart Encoding = omit
	.byte	0                       @ @TType Encoding = absptr
	.byte	93                      @ @TType base offset
	.byte	3                       @ Call site Encoding = udata4
	.byte	91                      @ Call site table length
	.long	.Lfunc_begin0-.Lfunc_begin0 @ >> Call Site 1 <<
	.long	.Ltmp0-.Lfunc_begin0    @   Call between .Lfunc_begin0 and .Ltmp0
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.long	.Ltmp0-.Lfunc_begin0    @ >> Call Site 2 <<
	.long	.Ltmp1-.Ltmp0           @   Call between .Ltmp0 and .Ltmp1
	.long	.Ltmp2-.Lfunc_begin0    @     jumps to .Ltmp2
	.byte	0                       @   On action: cleanup
	.long	.Ltmp1-.Lfunc_begin0    @ >> Call Site 3 <<
	.long	.Ltmp3-.Ltmp1           @   Call between .Ltmp1 and .Ltmp3
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.long	.Ltmp3-.Lfunc_begin0    @ >> Call Site 4 <<
	.long	.Ltmp4-.Ltmp3           @   Call between .Ltmp3 and .Ltmp4
	.long	.Ltmp5-.Lfunc_begin0    @     jumps to .Ltmp5
	.byte	0                       @   On action: cleanup
	.long	.Ltmp4-.Lfunc_begin0    @ >> Call Site 5 <<
	.long	.Ltmp6-.Ltmp4           @   Call between .Ltmp4 and .Ltmp6
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.long	.Ltmp6-.Lfunc_begin0    @ >> Call Site 6 <<
	.long	.Ltmp7-.Ltmp6           @   Call between .Ltmp6 and .Ltmp7
	.long	.Ltmp8-.Lfunc_begin0    @     jumps to .Ltmp8
	.byte	0                       @   On action: cleanup
	.long	.Ltmp7-.Lfunc_begin0    @ >> Call Site 7 <<
	.long	.Lfunc_end6-.Ltmp7      @   Call between .Ltmp7 and .Lfunc_end6
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.p2align	2
	.fnend

	.globl	render
	.p2align	2
	.type	render,%function
render:                                 @ @render
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.vsave	{d8, d9, d10, d11}
	vpush	{d8, d9, d10, d11}
	.pad	#24
	sub	sp, sp, #24
	mov	r4, r0
	ldr	r0, [r4, #20]
	cmp	r0, #0
	beq	.LBB7_3
@ BB#1:                                 @ %.lr.ph
	vmov.f64	d11, #1.000000e+00
	movw	r7, :lower16:.L_MergedGlobals
	movw	r5, :lower16:scope
	mov	r6, #0
	movt	r7, :upper16:.L_MergedGlobals
	movt	r5, :upper16:scope
.LBB7_2:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r4, #24]
	ldr	r1, [r4]
	mul	r2, r0, r6
	ldr	r0, [r7, #12]
	add	r1, r1, r2, lsl #2
	vldr	s16, [r1, #4]
	vldr	s18, [r1]
	vmov.f32	s0, s16
	bl	_ZN11hit_manager4tickEf
	vmov.f32	s20, s0
	ldr	r0, [r7, #16]
	vmov.f32	s0, s18
	bl	_ZN11hit_manager4tickEf
	vmov.f32	s18, s0
	ldr	r0, [r7, #4]
	vmov.f32	s0, s20
	bl	_ZN8freeverb4tickEf
	vldr	s2, [r7, #8]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vcvt.f64.f32	d10, s20
	vcvt.f64.f32	d16, s2
	vsub.f64	d16, d11, d16
	vmul.f64	d16, d16, d10
	vmul.f32	d0, d1, d0
	vcvt.f64.f32	d17, s0
	vadd.f64	d16, d16, d17
	vcvt.f32.f64	s0, d16
	bl	_Z16distortion_clampf
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #4]
	mul	r1, r1, r6
	add	r0, r0, r1, lsl #2
	vstr	s0, [r0, #4]
	vmov.f32	s0, s18
	bl	_Z16distortion_clampf
	vabs.f32	d1, d8
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #4]
	mul	r1, r1, r6
	vcvt.f64.f32	d16, s2
	add	r0, r0, r1, lsl #2
	vmov	r2, r3, d16
	vstr	s0, [r0]
	ldr	r0, [r7, #12]
	ldr	r1, [r0, #80]
	vldr	s0, [r0, #96]
	mov	r0, r5
	vldr	s2, [r1, #44]
	vcvt.f64.f32	d16, s0
	vcvt.f64.f32	d17, s2
	vstmia	sp, {d16, d17}
	vstr	d10, [sp, #16]
	bl	_ZN5Scope3logEdz
	add	r6, r6, #1
	ldr	r0, [r4, #20]
	cmp	r6, r0
	blo	.LBB7_2
.LBB7_3:                                @ %._crit_edge
	sub	sp, r11, #48
	vpop	{d8, d9, d10, d11}
	pop	{r4, r5, r6, r7, r11, pc}
.Lfunc_end7:
	.size	render, .Lfunc_end7-render
	.fnend

	.globl	cleanup
	.p2align	2
	.type	cleanup,%function
cleanup:                                @ @cleanup
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end8:
	.size	cleanup, .Lfunc_end8-cleanup
	.fnend

	.section	.text.startup,"ax",%progbits
	.p2align	2
	.type	_GLOBAL__sub_I_render.ii,%function
_GLOBAL__sub_I_render.ii:               @ @_GLOBAL__sub_I_render.ii
	.fnstart
@ BB#0:
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	movw	r4, :lower16:scope
	movt	r4, :upper16:scope
	mov	r0, r4
	bl	_ZN5ScopeC1Ev
	movw	r5, :lower16:__dso_handle
	movw	r0, :lower16:_ZN5ScopeD1Ev
	movt	r5, :upper16:__dso_handle
	movt	r0, :upper16:_ZN5ScopeD1Ev
	mov	r1, r4
	mov	r2, r5
	bl	__cxa_atexit
	movw	r4, :lower16:midi
	movt	r4, :upper16:midi
	mov	r0, r4
	bl	_ZN4MidiC1Ev
	movw	r0, :lower16:_ZN4MidiD1Ev
	mov	r1, r4
	movt	r0, :upper16:_ZN4MidiD1Ev
	mov	r2, r5
	pop	{r4, r5, r11, lr}
	b	__cxa_atexit
.Lfunc_end9:
	.size	_GLOBAL__sub_I_render.ii, .Lfunc_end9-_GLOBAL__sub_I_render.ii
	.fnend

	.type	scope,%object           @ @scope
	.bss
	.globl	scope
	.p2align	2
scope:
	.zero	212
	.size	scope, 212

	.type	midi,%object            @ @midi
	.globl	midi
	.p2align	2
midi:
	.zero	136
	.size	midi, 136

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"hw:1,0,0"
	.size	.L.str, 9

	.type	.L.str.2,%object        @ @.str.2
.L.str.2:
	.asciz	"got sysex message size: %d\n"
	.size	.L.str.2, 28

	.type	.L.str.3,%object        @ @.str.3
.L.str.3:
	.asciz	"scene was switched to: %d!\n"
	.size	.L.str.3, 28

	.type	.L.str.4,%object        @ @.str.4
.L.str.4:
	.asciz	"%02X "
	.size	.L.str.4, 6

	.type	.L.str.5,%object        @ @.str.5
.L.str.5:
	.asciz	"\n"
	.size	.L.str.5, 2

	.type	.L.str.6,%object        @ @.str.6
.L.str.6:
	.asciz	"cc message received: %d %d\n"
	.size	.L.str.6, 28

	.type	.L.str.7,%object        @ @.str.7
.L.str.7:
	.asciz	"cc%d: hi pitch: %.02f\n"
	.size	.L.str.7, 23

	.type	.L.str.8,%object        @ @.str.8
.L.str.8:
	.asciz	"cc%d: low pitch: %.02f\n"
	.size	.L.str.8, 24

	.type	.L.str.9,%object        @ @.str.9
.L.str.9:
	.asciz	"cc%d: gate time: %.02f\n"
	.size	.L.str.9, 24

	.type	.L.str.10,%object       @ @.str.10
.L.str.10:
	.asciz	"cc%d: stut length: %.02f\n"
	.size	.L.str.10, 26

	.type	.L.str.11,%object       @ @.str.11
.L.str.11:
	.asciz	"cc%d: stut pitch mod: %.02f\n"
	.size	.L.str.11, 29

	.type	.L.str.12,%object       @ @.str.12
.L.str.12:
	.asciz	"cc%d: delay length: %.02f\n"
	.size	.L.str.12, 27

	.type	.L.str.13,%object       @ @.str.13
.L.str.13:
	.asciz	"cc%d: delay pmod: %.02f\n"
	.size	.L.str.13, 25

	.type	.L.str.14,%object       @ @.str.14
.L.str.14:
	.asciz	"cc%d: rev len: %.02f\n"
	.size	.L.str.14, 22

	.type	.L.str.15,%object       @ @.str.15
.L.str.15:
	.asciz	"cc%d: rev mix: %.02f\n"
	.size	.L.str.15, 22

	.type	.L.str.16,%object       @ @.str.16
.L.str.16:
	.asciz	"cc%d: hi threshold: %.02f\n"
	.size	.L.str.16, 27

	.type	.L.str.17,%object       @ @.str.17
.L.str.17:
	.asciz	"cc%d: low threshold: %.02f\n"
	.size	.L.str.17, 28

	.type	.L.str.18,%object       @ @.str.18
.L.str.18:
	.asciz	"cc%d: boost: %.02f\n"
	.size	.L.str.18, 20

	.type	.L.str.19,%object       @ @.str.19
.L.str.19:
	.asciz	"cc%d: stut count: %.02f\n"
	.size	.L.str.19, 25

	.type	.L.str.20,%object       @ @.str.20
.L.str.20:
	.asciz	"cc%d: stut length mmod: %.02f\n"
	.size	.L.str.20, 31

	.type	.L.str.21,%object       @ @.str.21
.L.str.21:
	.asciz	"cc%d: delay count: %.02f\n"
	.size	.L.str.21, 26

	.type	.L.str.22,%object       @ @.str.22
.L.str.22:
	.asciz	"cc%d: delay smod: %.02f\n"
	.size	.L.str.22, 25

	.type	.L.str.23,%object       @ @.str.23
.L.str.23:
	.asciz	"cc%d: rev feedback: %.02f\n"
	.size	.L.str.23, 27

	.type	.L.str.24,%object       @ @.str.24
.L.str.24:
	.asciz	"cc%d: do_bend: %s\n"
	.size	.L.str.24, 19

	.type	.L.str.25,%object       @ @.str.25
.L.str.25:
	.asciz	"ON"
	.size	.L.str.25, 3

	.type	.L.str.26,%object       @ @.str.26
.L.str.26:
	.asciz	"OFF"
	.size	.L.str.26, 4

	.type	.L.str.27,%object       @ @.str.27
.L.str.27:
	.asciz	"cc%d: stut lmod_up: %s\n"
	.size	.L.str.27, 24

	.type	.L.str.28,%object       @ @.str.28
.L.str.28:
	.asciz	"cc%d: hi pitch up: %s\n"
	.size	.L.str.28, 23

	.type	.L.str.29,%object       @ @.str.29
.L.str.29:
	.asciz	"cc%d: low pitch up: %s\n"
	.size	.L.str.29, 24

	.type	.L.str.30,%object       @ @.str.30
.L.str.30:
	.asciz	"cc%d: stut pmod_up: %s\n"
	.size	.L.str.30, 24

	.type	.L.str.31,%object       @ @.str.31
.L.str.31:
	.asciz	"cc%d: reverb hold: %s\n"
	.size	.L.str.31, 23

	.type	.L.str.32,%object       @ @.str.32
.L.str.32:
	.asciz	"getting system message!\n"
	.size	.L.str.32, 25

	.type	td1,%object             @ @td1
	.bss
	.globl	td1
	.p2align	2
td1:
	.long	0
	.size	td1, 4

	.type	.L.str.33,%object       @ @.str.33
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.33:
	.asciz	"sample rate is: %d\n"
	.size	.L.str.33, 20

	.type	.L.str.36,%object       @ @.str.36
.L.str.36:
	.asciz	"setup complete"
	.size	.L.str.36, 15

	.type	skip_first_samples,%object @ @skip_first_samples
	.bss
	.globl	skip_first_samples
skip_first_samples:
	.byte	0                       @ 0x0
	.size	skip_first_samples, 1

	.type	skip_count,%object      @ @skip_count
	.globl	skip_count
	.p2align	2
skip_count:
	.long	0                       @ 0x0
	.size	skip_count, 4

	.section	.init_array,"aw",%init_array
	.p2align	2
	.long	_GLOBAL__sub_I_render.ii(target1)
	.type	.Lstr,%object           @ @str
	.section	.rodata.str1.16,"aMS",%progbits,1
	.p2align	4
.Lstr:
	.asciz	"about to setup snare channel..."
	.size	.Lstr, 32

	.type	.Lstr.1,%object         @ @str.1
	.p2align	4
.Lstr.1:
	.asciz	"about to setup kick channel..."
	.size	.Lstr.1, 31

	.type	.L_MergedGlobals,%object @ @_MergedGlobals
	.data
	.p2align	4
.L_MergedGlobals:
	.long	0                       @ 0x0
	.long	0
	.long	0                       @ float 0
	.long	0
	.long	0
	.long	.L.str
	.size	.L_MergedGlobals, 24


	.globl	sample_rate
sample_rate = .L_MergedGlobals
	.size	sample_rate, 4
	.globl	ourReverb
ourReverb = .L_MergedGlobals+4
	.size	ourReverb, 4
	.globl	reverbMix
reverbMix = .L_MergedGlobals+8
	.size	reverbMix, 4
	.globl	snare_channel
snare_channel = .L_MergedGlobals+12
	.size	snare_channel, 4
	.globl	kick_channel
kick_channel = .L_MergedGlobals+16
	.size	kick_channel, 4
	.globl	gMidiPort0
gMidiPort0 = .L_MergedGlobals+20
	.size	gMidiPort0, 4
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
