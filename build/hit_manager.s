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
.Lfunc_end0:
	.size	_ZN11hit_manager12map_to_rangeEfff, .Lfunc_end0-_ZN11hit_manager12map_to_rangeEfff
	.fnend

	.globl	_ZN11hit_managerC2Ef
	.p2align	4
	.type	_ZN11hit_managerC2Ef,%function
_ZN11hit_managerC2Ef:                   @ @_ZN11hit_managerC2Ef
.Lfunc_begin0:
	.fnstart
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.vsave	{d8}
	vpush	{d8}
	mov	r4, r0
	adr	r0, .LCPI1_0
	vld1.64	{d16, d17}, [r0:128]
	movw	r0, #13107
	movt	r0, #16179
	mov	r6, #0
	str	r0, [r4]
	add	r0, r4, #24
	str	r6, [r4, #12]
	movw	r1, #3000
	str	r6, [r4, #20]
	vorr	d8, d0, d0
	vst1.32	{d16, d17}, [r0]
	mov	r0, #1065353216
	str	r0, [r4, #40]
	str	r1, [r4, #44]
	str	r6, [r4, #48]
	str	r6, [r4, #52]
	str	r6, [r4, #56]
	str	r6, [r4, #76]
	str	r0, [r4, #64]
	mov	r0, #20
	str	r6, [r4, #68]
	bl	_Znwj
	mov	r5, r0
	mov	r0, #2000
	str	r0, [r5, #12]
.Ltmp0:
	mov	r0, #8000
	bl	_Znaj
.Ltmp1:
@ BB#1:
	movw	r1, #4719
	mov	r2, #8000
	movt	r1, #14851
	str	r1, [r5, #16]
	mov	r1, #0
	stm	r5, {r0, r6}
	str	r6, [r5, #8]
	bl	memset
	vmov.f32	d16, #2.500000e-01
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	str	r5, [r4, #16]
	vstr	s16, [r4, #72]
	vmul.f32	d16, d8, d16
	vcvt.s32.f32	d0, d16
	vmov	r1, s0
	str	r1, [r4, #4]
	bl	printf
	vldr	s0, .LCPI1_1
	vldr	s2, [r4, #72]
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
@ BB#2:
	str	r5, [r4, #60]
	mov	r0, r4
	vpop	{d8}
	pop	{r4, r5, r6, r10, r11, pc}
.LBB1_3:
.Ltmp5:
	b	.LBB1_5
.LBB1_4:
.Ltmp2:
.LBB1_5:
	mov	r4, r0
	mov	r0, r5
	bl	_ZdlPv
	mov	r0, r4
	mov	lr, pc
	b	_Unwind_Resume
	.p2align	4
@ BB#6:
.LCPI1_0:
	.long	0                       @ float 0
	.long	1036831949              @ float 0.100000001
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
.LCPI1_1:
	.long	1022739087              @ float 0.0299999993
.Lfunc_end1:
	.size	_ZN11hit_managerC2Ef, .Lfunc_end1-_ZN11hit_managerC2Ef
	.globl	__gxx_personality_v0
	.personality __gxx_personality_v0
	.handlerdata
	.p2align	2
GCC_except_table1:
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
	.long	.Lfunc_end1-.Ltmp4      @   Call between .Ltmp4 and .Lfunc_end1
	.long	0                       @     has no landing pad
	.byte	0                       @   On action: cleanup
	.p2align	2
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
	vldr	s0, [r0, #72]
	vmul.f32	d0, d16, d0
	vcvt.f64.f32	d16, s0
	vmov	r2, r3, d16
	vstr	s0, [r0, #24]
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	rt_printf
	pop	{r11, pc}
.Lfunc_end2:
	.size	_ZN11hit_manager14set_pitch_bendEf, .Lfunc_end2-_ZN11hit_manager14set_pitch_bendEf
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
	vldr	s2, .LCPI3_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s4, .LCPI3_1
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
.LCPI3_0:
	.long	1045220558              @ float 0.200000018
.LCPI3_1:
	.long	1036831949              @ float 0.100000001
.Lfunc_end3:
	.size	_ZN11hit_manager17set_hit_thresholdEf, .Lfunc_end3-_ZN11hit_manager17set_hit_thresholdEf
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
	ldr	r1, [r0, #4]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d2, #-1.000000e+00
	vmov	s2, r1
	vcvt.f32.s32	d16, d1
	vmov.f32	d1, #1.000000e+00
	vcmpe.f32	s0, s2
	vmrs	APSR_nzcv, fpscr
	vadd.f32	d16, d16, d16
	vmul.f32	d17, d16, d0
	vsub.f32	d3, d16, d17
	vmoveq.f32	s6, s4
	vcvt.f64.f32	d16, s6
	vmov	r2, r3, d16
	vstr	s6, [r0, #32]
	movw	r0, :lower16:.L.str.3
	movt	r0, :upper16:.L.str.3
	bl	rt_printf
	pop	{r11, pc}
.Lfunc_end4:
	.size	_ZN11hit_manager13set_gate_timeEf, .Lfunc_end4-_ZN11hit_manager13set_gate_timeEf
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
.Lfunc_end5:
	.size	_ZN11hit_manager9set_boostEf, .Lfunc_end5-_ZN11hit_manager9set_boostEf
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
	vldr	s2, .LCPI6_0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmul.f32	d16, d0, d1
	vldr	s0, [r0, #72]
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
.LCPI6_0:
	.long	1028443341              @ float 0.0500000007
.Lfunc_end6:
	.size	_ZN11hit_manager15set_stut_lengthEf, .Lfunc_end6-_ZN11hit_manager15set_stut_lengthEf
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
.Lfunc_end7:
	.size	_ZN11hit_manager18set_stut_max_countEf, .Lfunc_end7-_ZN11hit_manager18set_stut_max_countEf
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
	vldr	s2, .LCPI8_0
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
.LCPI8_0:
	.long	1028443341              @ float 0.0500000007
.Lfunc_end8:
	.size	_ZN11hit_manager18set_stut_pitch_modEf, .Lfunc_end8-_ZN11hit_manager18set_stut_pitch_modEf
	.fnend

	.globl	_ZN11hit_manager19set_stut_length_modEf
	.p2align	2
	.type	_ZN11hit_manager19set_stut_length_modEf,%function
_ZN11hit_manager19set_stut_length_modEf: @ @_ZN11hit_manager19set_stut_length_modEf
	.fnstart
@ BB#0:
	bx	lr
.Lfunc_end9:
	.size	_ZN11hit_manager19set_stut_length_modEf, .Lfunc_end9-_ZN11hit_manager19set_stut_length_modEf
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
	ldr	r0, [r4, #60]
	pop	{r4, r10, r11, lr}
	b	_ZN3hit5resetEv
.Lfunc_end10:
	.size	_ZN11hit_manager12hit_happenedEv, .Lfunc_end10-_ZN11hit_manager12hit_happenedEv
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
	vldr	s0, [r4, #64]
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
	vstr	s0, [r4, #76]
	ldr	r0, [r4, #20]
	cmp	r0, #0
	bne	.LBB11_3
@ BB#1:
	vldr	s2, [r4, #28]
	vadd.f32	d0, d1, d0
	vcmpe.f32	s18, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB11_10
@ BB#2:
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	rt_printf
	mov	r0, #1
	str	r0, [r4, #20]
	mov	r0, #0
	str	r0, [r4, #12]
	ldr	r0, [r4, #60]
	bl	_ZN3hit5resetEv
	ldr	r0, [r4, #20]
.LBB11_3:                               @ %thread-pre-split
	cmp	r0, #1
	bne	.LBB11_10
@ BB#4:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #4]
	cmp	r0, r1
	bge	.LBB11_9
@ BB#5:
	ldr	r1, [r4, #8]
	cmp	r0, r1
	blt	.LBB11_8
@ BB#6:
	vldr	s0, [r4, #28]
	vldr	s2, [r4, #76]
	vadd.f32	d0, d0, d1
	vcmpe.f32	s18, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB11_10
@ BB#7:
	movw	r0, :lower16:.L.str.8
	movt	r0, :upper16:.L.str.8
	bl	rt_printf
	mov	r0, #1
	str	r0, [r4, #20]
	mov	r0, #0
	str	r0, [r4, #12]
	ldr	r0, [r4, #60]
	bl	_ZN3hit5resetEv
.LBB11_8:
	vmov.f32	s0, s16
	ldr	r0, [r4, #60]
	bl	_ZN3hit10add_sampleEf
	ldr	r0, [r4, #12]
	add	r0, r0, #1
	str	r0, [r4, #12]
	b	.LBB11_10
.LBB11_9:
	vmov.f32	s0, s16
	ldr	r0, [r4, #60]
	bl	_ZN3hit10add_sampleEf
	mov	r0, #0
	str	r0, [r4, #20]
.LBB11_10:                              @ %thread-pre-split.thread
	ldr	r0, [r4, #60]
	vpop	{d8, d9}
	pop	{r4, r5, r11, lr}
	b	_ZN3hit4tickEv
.Lfunc_end11:
	.size	_ZN11hit_manager4tickEf, .Lfunc_end11-_ZN11hit_manager4tickEf
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


	.globl	_ZN11hit_managerC1Ef
	.type	_ZN11hit_managerC1Ef,%function
_ZN11hit_managerC1Ef = _ZN11hit_managerC2Ef
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
