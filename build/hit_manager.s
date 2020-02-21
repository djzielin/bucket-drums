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
	.file	"/root/Bela/projects/bucket-drums/build/hit_manager.bc"
	.globl	_ZN11hit_managerC2Eff
	.p2align	4
	.type	_ZN11hit_managerC2Eff,%function
_ZN11hit_managerC2Eff:                  @ @_ZN11hit_managerC2Eff
.Lfunc_begin0:
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.setfp	r11, sp, #24
	add	r11, sp, #24
	.vsave	{d8, d9}
	vpush	{d8, d9}
	vmov.f32	s2, s1
	mov	r4, r0
	movw	r0, #13107
	mov	r7, #0
	movt	r0, #16179
	movw	r1, #3000
	str	r0, [r4]
	adr	r3, .LCPI0_0
	vld1.64	{d16, d17}, [r3:128]
	add	r0, r4, #24
	mov	r2, #1065353216
	mov	r3, #4
	vcvt.s32.f32	d9, d1
	str	r7, [r4, #12]
	str	r7, [r4, #20]
	vmov.f64	d8, d0
	vmov	r8, s18
	vst1.32	{d16, d17}, [r0]
	mov	r0, #1056964608
	str	r2, [r4, #40]
	str	r1, [r4, #44]
	str	r7, [r4, #52]
	str	r7, [r4, #48]
	str	r7, [r4, #59]
	str	r7, [r4, #55]
	str	r2, [r4, #84]
	str	r7, [r4, #88]
	str	r7, [r4, #96]
	str	r0, [r4, #100]
	mov	r0, #20
	umull	r9, r6, r8, r3
	bl	_Znwj
	cmp	r6, #0
	mov	r5, r0
	movwne	r6, #1
	cmp	r6, #0
	str	r8, [r5, #12]
	mvnne	r9, #0
.Ltmp0:
	mov	r0, r9
	bl	_Znaj
.Ltmp1:
@ BB#1:                                 @ %.noexc
	vcvt.f32.s32	d1, d9
	cmp	r8, #1
	vmov.f32	d0, #1.000000e+00
	vdiv.f32	s0, s0, s2
	vstr	s0, [r5, #16]
	stm	r5, {r0, r7}
	str	r7, [r5, #8]
	blt	.LBB0_3
@ BB#2:                                 @ %.lr.ph.i.i
	lsl	r2, r8, #2
	mov	r1, #0
	bl	memset
.LBB0_3:                                @ %_ZN21simple_moving_averageC2Ei.exit
	vmov.f32	d16, #2.500000e-01
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	str	r5, [r4, #16]
	vstr	s16, [r4, #92]
	vmul.f32	d16, d8, d16
	vcvt.s32.f32	d0, d16
	vmov	r1, s0
	str	r1, [r4, #4]
	bl	printf
	vldr	s0, .LCPI0_1
	vldr	s2, [r4, #92]
	vmul.f32	d16, d1, d0
	vcvt.s32.f32	d0, d16
	vmov	r0, s0
	str	r0, [r4, #8]
	mov	r0, #48
	bl	_Znwj
	mov	r5, r0
.Ltmp3:
	mov	r1, r4
	bl	_ZN3hitC1EP11hit_manager
.Ltmp4:
@ BB#4:
	str	r5, [r4, #80]
	mov	r0, r4
	vpop	{d8, d9}
	pop	{r4, r5, r6, r7, r8, r9, r11, pc}
.LBB0_5:
.Ltmp5:
	b	.LBB0_7
.LBB0_6:
.Ltmp2:
.LBB0_7:
	mov	r4, r0
	mov	r0, r5
	bl	_ZdlPv
	mov	r0, r4
	mov	lr, pc
	b	_Unwind_Resume
	.p2align	4
@ BB#8:
.LCPI0_0:
	.long	0                       @ float 0
	.long	1036831949              @ float 0.100000001
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
.LCPI0_1:
	.long	1022739087              @ float 0.0299999993
.Lfunc_end0:
	.size	_ZN11hit_managerC2Eff, .Lfunc_end0-_ZN11hit_managerC2Eff
	.globl	__gxx_personality_v0
	.personality __gxx_personality_v0
	.handlerdata
	.p2align	2
GCC_except_table0:
.Lexception0:
	.byte	255                     @ @LPStart Encoding = omit
	.byte	0                       @ @TType Encoding = absptr
	.asciz	"\303\200"              @ @TType base offset
	.byte	3                       @ Call site Encoding = udata4
	.byte	65                      @ Call site table length
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
	.long	.Lfunc_end0-.Ltmp4      @   Call between .Ltmp4 and .Lfunc_end0
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.p2align	2
	.fnend

	.globl	_ZN11hit_manager12map_to_rangeEfff
	.p2align	2
	.type	_ZN11hit_manager12map_to_rangeEfff,%function
_ZN11hit_manager12map_to_rangeEfff:     @ @_ZN11hit_manager12map_to_rangeEfff
	.fnstart
@ BB#0:
	vmov.f32	s4, s1
                                        @ kill: %S2<def> %S2<kill> %D1<def>
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vsub.f32	d16, d1, d2
	vmul.f32	d16, d16, d0
	vadd.f32	d0, d16, d2
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	bx	lr
.Lfunc_end1:
	.size	_ZN11hit_manager12map_to_rangeEfff, .Lfunc_end1-_ZN11hit_manager12map_to_rangeEfff
	.fnend

	.globl	_ZN11hit_manager14set_base_pitchEf
	.p2align	2
	.type	_ZN11hit_manager14set_base_pitchEf,%function
_ZN11hit_manager14set_base_pitchEf:     @ @_ZN11hit_manager14set_base_pitchEf
	.fnstart
@ BB#0:
	vmov.f32	d16, #-5.000000e-01
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d17, #1.000000e+00
	vmul.f32	d16, d0, d16
	vadd.f32	d0, d16, d17
	vstr	s0, [r0]
	bx	lr
.Lfunc_end2:
	.size	_ZN11hit_manager14set_base_pitchEf, .Lfunc_end2-_ZN11hit_manager14set_base_pitchEf
	.fnend

	.globl	_ZN11hit_manager14set_pitch_bendEf
	.p2align	2
	.type	_ZN11hit_manager14set_pitch_bendEf,%function
_ZN11hit_manager14set_pitch_bendEf:     @ @_ZN11hit_manager14set_pitch_bendEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vmov.f32	d16, #2.500000e-01
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmul.f32	d16, d0, d16
	vldr	s0, [r0, #92]
	vmul.f32	d0, d16, d0
	vcvt.f64.f32	d16, s0
	vmov	r2, r3, d16
	vstr	s0, [r0, #24]
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	rt_printf
	pop	{r11, pc}
.Lfunc_end3:
	.size	_ZN11hit_manager14set_pitch_bendEf, .Lfunc_end3-_ZN11hit_manager14set_pitch_bendEf
	.fnend

	.globl	_ZN11hit_manager17set_hit_thresholdEf
	.p2align	2
	.type	_ZN11hit_manager17set_hit_thresholdEf,%function
_ZN11hit_manager17set_hit_thresholdEf:  @ @_ZN11hit_manager17set_hit_thresholdEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vldr	s2, .LCPI4_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s4, .LCPI4_1
	vmul.f32	d16, d0, d1
	vadd.f32	d0, d16, d2
	vcvt.f64.f32	d16, s0
	vmov	r2, r3, d16
	vstr	s0, [r0, #28]
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	rt_printf
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI4_0:
	.long	1036831950              @ float 0.100000009
.LCPI4_1:
	.long	1028443341              @ float 0.0500000007
.Lfunc_end4:
	.size	_ZN11hit_manager17set_hit_thresholdEf, .Lfunc_end4-_ZN11hit_manager17set_hit_thresholdEf
	.fnend

	.globl	_ZN11hit_manager13set_gate_timeEf
	.p2align	2
	.type	_ZN11hit_manager13set_gate_timeEf,%function
_ZN11hit_manager13set_gate_timeEf:      @ @_ZN11hit_manager13set_gate_timeEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s2, .LCPI5_0
	vmov.f32	d16, #1.000000e+00
	vmov.f32	d2, #-1.000000e+00
	vcmpe.f32	s0, #0
	vmrs	APSR_nzcv, fpscr
	vmul.f32	d17, d0, d1
	vldr	s2, [r0, #92]
	vadd.f32	d16, d17, d16
	vmul.f32	d1, d1, d16
	vmoveq.f32	s2, s4
	vcvt.f64.f32	d16, s2
	vmov	r2, r3, d16
	vstr	s2, [r0, #32]
	movw	r0, :lower16:.L.str.3
	movt	r0, :upper16:.L.str.3
	bl	rt_printf
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI5_0:
	.long	3212333548              @ float -0.970000028
.Lfunc_end5:
	.size	_ZN11hit_manager13set_gate_timeEf, .Lfunc_end5-_ZN11hit_manager13set_gate_timeEf
	.fnend

	.globl	_ZN11hit_manager9set_boostEf
	.p2align	2
	.type	_ZN11hit_manager9set_boostEf,%function
_ZN11hit_manager9set_boostEf:           @ @_ZN11hit_manager9set_boostEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vmov.f32	d16, #9.000000e+00
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d17, #1.000000e+00
	vmul.f32	d16, d0, d16
	vadd.f32	d0, d16, d17
	vcvt.f64.f32	d16, s0
	vmov	r2, r3, d16
	vstr	s0, [r0, #36]
	movw	r0, :lower16:.L.str.4
	movt	r0, :upper16:.L.str.4
	bl	rt_printf
	pop	{r11, pc}
.Lfunc_end6:
	.size	_ZN11hit_manager9set_boostEf, .Lfunc_end6-_ZN11hit_manager9set_boostEf
	.fnend

	.globl	_ZN11hit_manager15set_stut_lengthEf
	.p2align	2
	.type	_ZN11hit_manager15set_stut_lengthEf,%function
_ZN11hit_manager15set_stut_lengthEf:    @ @_ZN11hit_manager15set_stut_lengthEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vldr	s2, .LCPI7_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s4, .LCPI7_1
	vmul.f32	d16, d0, d1
	vldr	s0, [r0, #92]
	vadd.f32	d16, d16, d2
	vmul.f32	d16, d16, d0
	vcvt.s32.f32	d0, d16
	vmov	r1, s0
	str	r1, [r0, #44]
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	bl	rt_printf
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI7_0:
	.long	1026832728              @ float 0.0439999998
.LCPI7_1:
	.long	1002740646              @ float 0.00600000005
.Lfunc_end7:
	.size	_ZN11hit_manager15set_stut_lengthEf, .Lfunc_end7-_ZN11hit_manager15set_stut_lengthEf
	.fnend

	.globl	_ZN11hit_manager18set_stut_max_countEf
	.p2align	2
	.type	_ZN11hit_manager18set_stut_max_countEf,%function
_ZN11hit_manager18set_stut_max_countEf: @ @_ZN11hit_manager18set_stut_max_countEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vmov.f32	d16, #2.000000e+01
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmul.f32	d16, d0, d16
	vcvt.s32.f32	d0, d16
	vmov	r1, s0
	str	r1, [r0, #48]
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	bl	rt_printf
	pop	{r11, pc}
.Lfunc_end8:
	.size	_ZN11hit_manager18set_stut_max_countEf, .Lfunc_end8-_ZN11hit_manager18set_stut_max_countEf
	.fnend

	.globl	_ZN11hit_manager18set_stut_pitch_modEf
	.p2align	2
	.type	_ZN11hit_manager18set_stut_pitch_modEf,%function
_ZN11hit_manager18set_stut_pitch_modEf: @ @_ZN11hit_manager18set_stut_pitch_modEf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	vldr	s2, .LCPI9_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmul.f32	d0, d0, d1
	vcvt.f64.f32	d16, s0
	vmov	r2, r3, d16
	vstr	s0, [r0, #52]
	movw	r0, :lower16:.L.str.7
	movt	r0, :upper16:.L.str.7
	bl	rt_printf
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI9_0:
	.long	1028443341              @ float 0.0500000007
.Lfunc_end9:
	.size	_ZN11hit_manager18set_stut_pitch_modEf, .Lfunc_end9-_ZN11hit_manager18set_stut_pitch_modEf
	.fnend

	.globl	_ZN11hit_manager19set_stut_length_modEf
	.p2align	2
	.type	_ZN11hit_manager19set_stut_length_modEf,%function
_ZN11hit_manager19set_stut_length_modEf: @ @_ZN11hit_manager19set_stut_length_modEf
	.fnstart
@ BB#0:
	vldr	s2, .LCPI10_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d16, #1.000000e+00
	vmul.f32	d17, d0, d1
	vadd.f32	d0, d17, d16
	vstr	s0, [r0, #56]
	bx	lr
	.p2align	2
@ BB#1:
.LCPI10_0:
	.long	3184315600              @ float -0.100000024
.Lfunc_end10:
	.size	_ZN11hit_manager19set_stut_length_modEf, .Lfunc_end10-_ZN11hit_manager19set_stut_length_modEf
	.fnend

	.globl	_ZN11hit_manager16set_delay_lengthEf
	.p2align	2
	.type	_ZN11hit_manager16set_delay_lengthEf,%function
_ZN11hit_manager16set_delay_lengthEf:   @ @_ZN11hit_manager16set_delay_lengthEf
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end11:
	.size	_ZN11hit_manager16set_delay_lengthEf, .Lfunc_end11-_ZN11hit_manager16set_delay_lengthEf
	.fnend

	.globl	_ZN11hit_manager15set_delay_countEf
	.p2align	2
	.type	_ZN11hit_manager15set_delay_countEf,%function
_ZN11hit_manager15set_delay_countEf:    @ @_ZN11hit_manager15set_delay_countEf
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end12:
	.size	_ZN11hit_manager15set_delay_countEf, .Lfunc_end12-_ZN11hit_manager15set_delay_countEf
	.fnend

	.globl	_ZN11hit_manager14set_delay_pmodEf
	.p2align	2
	.type	_ZN11hit_manager14set_delay_pmodEf,%function
_ZN11hit_manager14set_delay_pmodEf:     @ @_ZN11hit_manager14set_delay_pmodEf
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end13:
	.size	_ZN11hit_manager14set_delay_pmodEf, .Lfunc_end13-_ZN11hit_manager14set_delay_pmodEf
	.fnend

	.globl	_ZN11hit_manager14set_delay_smodEf
	.p2align	2
	.type	_ZN11hit_manager14set_delay_smodEf,%function
_ZN11hit_manager14set_delay_smodEf:     @ @_ZN11hit_manager14set_delay_smodEf
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end14:
	.size	_ZN11hit_manager14set_delay_smodEf, .Lfunc_end14-_ZN11hit_manager14set_delay_smodEf
	.fnend

	.globl	_ZN11hit_manager23set_stut_lmod_up_buttonEb
	.p2align	2
	.type	_ZN11hit_manager23set_stut_lmod_up_buttonEb,%function
_ZN11hit_manager23set_stut_lmod_up_buttonEb: @ @_ZN11hit_manager23set_stut_lmod_up_buttonEb
	.fnstart
@ BB#0:
	strb	r1, [r0, #61]
	bx	lr
.Lfunc_end15:
	.size	_ZN11hit_manager23set_stut_lmod_up_buttonEb, .Lfunc_end15-_ZN11hit_manager23set_stut_lmod_up_buttonEb
	.fnend

	.globl	_ZN11hit_manager23set_stut_pmod_up_buttonEb
	.p2align	2
	.type	_ZN11hit_manager23set_stut_pmod_up_buttonEb,%function
_ZN11hit_manager23set_stut_pmod_up_buttonEb: @ @_ZN11hit_manager23set_stut_pmod_up_buttonEb
	.fnstart
@ BB#0:
	strb	r1, [r0, #60]
	bx	lr
.Lfunc_end16:
	.size	_ZN11hit_manager23set_stut_pmod_up_buttonEb, .Lfunc_end16-_ZN11hit_manager23set_stut_pmod_up_buttonEb
	.fnend

	.globl	_ZN11hit_manager11set_bend_upEb
	.p2align	2
	.type	_ZN11hit_manager11set_bend_upEb,%function
_ZN11hit_manager11set_bend_upEb:        @ @_ZN11hit_manager11set_bend_upEb
	.fnstart
@ BB#0:
	strb	r1, [r0, #62]
	bx	lr
.Lfunc_end17:
	.size	_ZN11hit_manager11set_bend_upEb, .Lfunc_end17-_ZN11hit_manager11set_bend_upEb
	.fnend

	.globl	_ZN11hit_manager12hit_happenedEv
	.p2align	2
	.type	_ZN11hit_manager12hit_happenedEv,%function
_ZN11hit_manager12hit_happenedEv:       @ @_ZN11hit_manager12hit_happenedEv
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	mov	r4, r0
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	rt_printf
	mov	r0, #1
	str	r0, [r4, #20]
	mov	r0, #0
	str	r0, [r4, #12]
	ldr	r0, [r4, #80]
	pop	{r4, r10, r11, lr}
	b	_ZN3hit5resetEv
.Lfunc_end18:
	.size	_ZN11hit_manager12hit_happenedEv, .Lfunc_end18-_ZN11hit_manager12hit_happenedEv
	.fnend

	.globl	_ZN11hit_manager4tickEf
	.p2align	2
	.type	_ZN11hit_manager4tickEf,%function
_ZN11hit_manager4tickEf:                @ @_ZN11hit_manager4tickEf
	.fnstart
@ BB#0:
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.vsave	{d8, d9}
	vpush	{d8, d9}
	vorr	d8, d0, d0
	mov	r4, r0
	ldr	r5, [r4, #16]
	vabs.f32	d9, d8
	vldr	s0, [r4, #84]
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	vldr	s4, [r5, #8]
	add	r1, r1, r0, lsl #2
	vmul.f32	d0, d0, d9
	add	r0, r0, #1
	vldr	s2, [r1]
	vsub.f32	d16, d0, d1
	vadd.f32	d1, d16, d2
	vstr	s2, [r5, #8]
	vstr	s0, [r1]
	ldr	r1, [r5, #12]
	bl	__aeabi_idivmod
	str	r1, [r5, #4]
	vldr	s0, [r5, #8]
	vldr	s2, [r5, #16]
	vmul.f32	d0, d1, d0
	vstr	s0, [r4, #96]
	ldr	r0, [r4, #20]
	cmp	r0, #0
	bne	.LBB19_3
@ BB#1:
	vldr	s2, [r4, #28]
	vadd.f32	d0, d1, d0
	vcmpe.f32	s18, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB19_8
@ BB#2:
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	rt_printf
	mov	r0, #1
	str	r0, [r4, #20]
	mov	r0, #0
	str	r0, [r4, #12]
	ldr	r0, [r4, #80]
	bl	_ZN3hit5resetEv
	ldr	r0, [r4, #20]
.LBB19_3:                               @ %thread-pre-split
	cmp	r0, #1
	bne	.LBB19_8
@ BB#4:
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #4]
	cmp	r1, r0
	bge	.LBB19_9
@ BB#5:
	ldr	r0, [r4, #8]
	cmp	r1, r0
	blt	.LBB19_10
@ BB#6:
	vldr	s0, [r4, #28]
	vldr	s2, [r4, #96]
	vadd.f32	d0, d0, d1
	vcmpe.f32	s18, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB19_10
@ BB#7:
	movw	r0, :lower16:.L.str.10
	movt	r0, :upper16:.L.str.10
	bl	rt_printf
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	rt_printf
	mov	r0, #1
	mov	r5, r4
	str	r0, [r4, #20]
	mov	r0, #0
	str	r0, [r4, #12]
	ldr	r0, [r5, #80]!
	bl	_ZN3hit5resetEv
	vmov.f32	s0, s16
	ldr	r0, [r5]
	bl	_ZN3hit10add_sampleEf
	ldr	r0, [r4, #12]
	add	r0, r0, #1
	str	r0, [r4, #12]
	mov	r4, r5
	b	.LBB19_11
.LBB19_8:                               @ %._crit_edge
	add	r4, r4, #80
	b	.LBB19_11
.LBB19_9:
	movw	r0, :lower16:.L.str.9
	movt	r0, :upper16:.L.str.9
	bl	rt_printf
	vmov.f32	s0, s16
	ldr	r0, [r4, #80]!
	bl	_ZN3hit10add_sampleEf
	mov	r0, #0
	str	r0, [r4, #-60]
	b	.LBB19_11
.LBB19_10:
	vmov.f32	s0, s16
	ldr	r0, [r4, #80]!
	bl	_ZN3hit10add_sampleEf
	ldr	r0, [r4, #-68]
	add	r0, r0, #1
	str	r0, [r4, #-68]
.LBB19_11:
	ldr	r0, [r4]
	vpop	{d8, d9}
	pop	{r4, r5, r11, lr}
	b	_ZN3hit4tickEv
.Lfunc_end19:
	.size	_ZN11hit_manager4tickEf, .Lfunc_end19-_ZN11hit_manager4tickEf
	.fnend

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"  max samples to record: %d\n"
	.size	.L.str, 29

	.type	.L.str.1,%object        @ @.str.1
.L.str.1:
	.asciz	"   computed pitch bend: %.02f\n"
	.size	.L.str.1, 31

	.type	.L.str.2,%object        @ @.str.2
.L.str.2:
	.asciz	"   computed threshold: %.02f\n"
	.size	.L.str.2, 30

	.type	.L.str.3,%object        @ @.str.3
.L.str.3:
	.asciz	"   computed gate time: %.02f\n"
	.size	.L.str.3, 30

	.type	.L.str.4,%object        @ @.str.4
.L.str.4:
	.asciz	"   computed boost: %.02f\n"
	.size	.L.str.4, 26

	.type	.L.str.5,%object        @ @.str.5
.L.str.5:
	.asciz	"   computed stut_length: %d\n"
	.size	.L.str.5, 29

	.type	.L.str.6,%object        @ @.str.6
.L.str.6:
	.asciz	"   computed stut_max_count: %d\n"
	.size	.L.str.6, 32

	.type	.L.str.7,%object        @ @.str.7
.L.str.7:
	.asciz	"   computed stut_pitch_mod: %.02f\n"
	.size	.L.str.7, 35

	.type	.L.str.8,%object        @ @.str.8
.L.str.8:
	.asciz	"hit happened!\n"
	.size	.L.str.8, 15

	.type	.L.str.9,%object        @ @.str.9
.L.str.9:
	.asciz	"recorded too many samples: %d\n"
	.size	.L.str.9, 31

	.type	.L.str.10,%object       @ @.str.10
.L.str.10:
	.asciz	"another hit interrupted!\n"
	.size	.L.str.10, 26


	.globl	_ZN11hit_managerC1Eff
	.type	_ZN11hit_managerC1Eff,%function
_ZN11hit_managerC1Eff = _ZN11hit_managerC2Eff
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
