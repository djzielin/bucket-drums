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
	.file	"/root/Bela/projects/bucket-drums/build/old/wave_generator.bc"
	.globl	_ZN14wave_generatorC2Ef
	.p2align	3
	.type	_ZN14wave_generatorC2Ef,%function
_ZN14wave_generatorC2Ef:                @ @_ZN14wave_generatorC2Ef
	.fnstart
@ BB#0:                                 @ %_ZN14wave_generator9set_pitchEf.exit
	vcvt.f64.f32	d16, s0
	mov	r1, #0
	vldr	d17, .LCPI0_0
	vldr	s4, .LCPI0_1
	vdiv.f64	d16, d17, d16
	vcvt.f32.f64	s2, d16
	vstr	s0, [r0]
	vmul.f32	d0, d1, d2
	vstr	s2, [r0, #16]
	str	r1, [r0, #12]
	movw	r1, #0
	movt	r1, #17372
	str	r1, [r0, #4]
	vstr	s0, [r0, #8]
	bx	lr
	.p2align	3
@ BB#1:
.LCPI0_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI0_1:
	.long	1138491392              @ float 440
.Lfunc_end0:
	.size	_ZN14wave_generatorC2Ef, .Lfunc_end0-_ZN14wave_generatorC2Ef
	.fnend

	.globl	_ZN14wave_generator5resetEv
	.p2align	2
	.type	_ZN14wave_generator5resetEv,%function
_ZN14wave_generator5resetEv:            @ @_ZN14wave_generator5resetEv
	.fnstart
@ BB#0:
	mov	r1, #0
	str	r1, [r0, #12]
	bx	lr
.Lfunc_end1:
	.size	_ZN14wave_generator5resetEv, .Lfunc_end1-_ZN14wave_generator5resetEv
	.fnend

	.globl	_ZN14wave_generator9set_pitchEf
	.p2align	3
	.type	_ZN14wave_generator9set_pitchEf,%function
_ZN14wave_generator9set_pitchEf:        @ @_ZN14wave_generator9set_pitchEf
	.fnstart
@ BB#0:
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	d16, .LCPI2_0
	vstr	s0, [r0, #4]
	vldr	s2, [r0, #16]
	vmul.f32	d0, d1, d0
	vstr	s0, [r0, #8]
	vldr	s0, [r0, #12]
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bxle	lr
	vldr	d18, .LCPI2_1
.LBB2_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d17, d18
	vcvt.f32.f64	s0, d17
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB2_1
@ BB#2:                                 @ %._crit_edge
	vstr	s0, [r0, #12]
	bx	lr
	.p2align	3
@ BB#3:
.LCPI2_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI2_1:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end2:
	.size	_ZN14wave_generator9set_pitchEf, .Lfunc_end2-_ZN14wave_generator9set_pitchEf
	.fnend

	.globl	_ZN14wave_generator9set_phaseEf
	.p2align	3
	.type	_ZN14wave_generator9set_phaseEf,%function
_ZN14wave_generator9set_phaseEf:        @ @_ZN14wave_generator9set_phaseEf
	.fnstart
@ BB#0:
	vcvt.f64.f32	d17, s0
	vldr	d16, .LCPI3_0
	vldr	s0, [r0, #12]
	vmul.f64	d17, d17, d16
	vcvt.f64.f32	d18, s0
	vadd.f64	d17, d18, d17
	vcvt.f32.f64	s0, d17
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	vstr	s0, [r0, #12]
	bxle	lr
	vldr	d18, .LCPI3_1
.LBB3_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d17, d18
	vcvt.f32.f64	s0, d17
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB3_1
@ BB#2:                                 @ %._crit_edge
	vstr	s0, [r0, #12]
	bx	lr
	.p2align	3
@ BB#3:
.LCPI3_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI3_1:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end3:
	.size	_ZN14wave_generator9set_phaseEf, .Lfunc_end3-_ZN14wave_generator9set_phaseEf
	.fnend

	.globl	_ZN14wave_generator14increment_waveEf
	.p2align	3
	.type	_ZN14wave_generator14increment_waveEf,%function
_ZN14wave_generator14increment_waveEf:  @ @_ZN14wave_generator14increment_waveEf
	.fnstart
@ BB#0:
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s2, [r0, #8]
	vldr	s4, [r0, #12]
	vmul.f32	d16, d1, d0
	vadd.f32	d0, d2, d16
	vldr	d16, .LCPI4_0
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	vstr	s0, [r0, #12]
	bxle	lr
	vldr	d18, .LCPI4_1
.LBB4_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d17, d18
	vcvt.f32.f64	s0, d17
	vcvt.f64.f32	d17, s0
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB4_1
@ BB#2:                                 @ %._crit_edge
	vstr	s0, [r0, #12]
	bx	lr
	.p2align	3
@ BB#3:
.LCPI4_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI4_1:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end4:
	.size	_ZN14wave_generator14increment_waveEf, .Lfunc_end4-_ZN14wave_generator14increment_waveEf
	.fnend

	.globl	_ZN14wave_generator9tick_sineEf
	.p2align	3
	.type	_ZN14wave_generator9tick_sineEf,%function
_ZN14wave_generator9tick_sineEf:        @ @_ZN14wave_generator9tick_sineEf
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.vsave	{d8, d9}
	vpush	{d8, d9}
	mov	r4, r0
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	d8, .LCPI5_0
	vldr	s4, [r4, #8]
	vldr	s2, [r4, #12]
	vmul.f32	d16, d2, d0
	vadd.f32	d0, d16, d1
	vcvt.f64.f32	d9, s0
	vstr	s0, [r4, #12]
	vmov.f32	s0, s2
	bl	sinf
	vcmpe.f64	d9, d8
	vmrs	APSR_nzcv, fpscr
	ble	.LBB5_4
@ BB#1:                                 @ %.lr.ph.i.preheader
	vldr	d16, .LCPI5_1
.LBB5_2:                                @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d9, d16
	vcvt.f32.f64	s2, d17
	vcvt.f64.f32	d9, s2
	vcmpe.f64	d9, d8
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB5_2
@ BB#3:                                 @ %._crit_edge.i
	vstr	s2, [r4, #12]
.LBB5_4:                                @ %_ZN14wave_generator14increment_waveEf.exit
	vpop	{d8, d9}
	pop	{r4, r10, r11, pc}
	.p2align	3
@ BB#5:
.LCPI5_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI5_1:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end5:
	.size	_ZN14wave_generator9tick_sineEf, .Lfunc_end5-_ZN14wave_generator9tick_sineEf
	.fnend

	.globl	_ZN14wave_generator14tick_sine_fastEf
	.p2align	3
	.type	_ZN14wave_generator14tick_sine_fastEf,%function
_ZN14wave_generator14tick_sine_fastEf:  @ @_ZN14wave_generator14tick_sine_fastEf
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.vsave	{d8}
	vpush	{d8}
	mov	r4, r0
	vorr	d8, d0, d0
	vldr	s0, [r4, #12]
	bl	sinf_neon_hfp
	vldr	s2, [r4, #8]
	vldr	s4, [r4, #12]
	vmul.f32	d16, d1, d8
	vadd.f32	d1, d2, d16
	vldr	d16, .LCPI6_0
	vcvt.f64.f32	d17, s2
	vcmpe.f64	d17, d16
	vstr	s2, [r4, #12]
	vmrs	APSR_nzcv, fpscr
	ble	.LBB6_4
@ BB#1:                                 @ %.lr.ph.i.preheader
	vldr	d18, .LCPI6_1
.LBB6_2:                                @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d17, d18
	vcvt.f32.f64	s2, d17
	vcvt.f64.f32	d17, s2
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB6_2
@ BB#3:                                 @ %._crit_edge.i
	vstr	s2, [r4, #12]
.LBB6_4:                                @ %_ZN14wave_generator14increment_waveEf.exit
	vpop	{d8}
	pop	{r4, r10, r11, pc}
	.p2align	3
@ BB#5:
.LCPI6_0:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI6_1:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end6:
	.size	_ZN14wave_generator14tick_sine_fastEf, .Lfunc_end6-_ZN14wave_generator14tick_sine_fastEf
	.fnend

	.globl	_ZN14wave_generator11tick_squareEf
	.p2align	3
	.type	_ZN14wave_generator11tick_squareEf,%function
_ZN14wave_generator11tick_squareEf:     @ @_ZN14wave_generator11tick_squareEf
	.fnstart
@ BB#0:
	vldr	s4, [r0, #12]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d3, #1.000000e+00
	vldr	d18, .LCPI7_0
	vcvt.f64.f32	d16, s4
	vcmpe.f64	d16, d18
	vmrs	APSR_nzcv, fpscr
	vldr	s2, [r0, #8]
	vldr	d16, .LCPI7_1
	vmul.f32	d17, d1, d0
	vmov.f32	d0, #-1.000000e+00
	vadd.f32	d1, d17, d2
	vcvt.f64.f32	d17, s2
	vcmpe.f64	d17, d16
	vmovlt.f32	s0, s6
	vstr	s2, [r0, #12]
	vmrs	APSR_nzcv, fpscr
	ble	.LBB7_4
@ BB#1:                                 @ %.lr.ph.i.preheader
	vldr	d18, .LCPI7_2
.LBB7_2:                                @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d17, d17, d18
	vcvt.f32.f64	s2, d17
	vcvt.f64.f32	d17, s2
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB7_2
@ BB#3:                                 @ %._crit_edge.i
	vstr	s2, [r0, #12]
.LBB7_4:                                @ %_ZN14wave_generator14increment_waveEf.exit
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	bx	lr
	.p2align	3
@ BB#5:
.LCPI7_0:
	.long	1413754136              @ double 3.1415926535897931
	.long	1074340347
.LCPI7_1:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI7_2:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.Lfunc_end7:
	.size	_ZN14wave_generator11tick_squareEf, .Lfunc_end7-_ZN14wave_generator11tick_squareEf
	.fnend

	.globl	_ZN14wave_generator8tick_sawEf
	.p2align	3
	.type	_ZN14wave_generator8tick_sawEf,%function
_ZN14wave_generator8tick_sawEf:         @ @_ZN14wave_generator8tick_sawEf
	.fnstart
@ BB#0:
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vldr	s2, [r0, #8]
	vmov.f32	d18, #-1.000000e+00
	vldr	s4, [r0, #12]
	vmul.f32	d16, d1, d0
	vldr	s0, .LCPI8_0
	vldr	d17, .LCPI8_1
	vmul.f32	d19, d2, d0
	vadd.f32	d1, d16, d2
	vadd.f32	d0, d19, d18
	vcvt.f64.f32	d16, s2
	vcmpe.f64	d16, d17
	vstr	s2, [r0, #12]
	vmrs	APSR_nzcv, fpscr
	ble	.LBB8_4
@ BB#1:                                 @ %.lr.ph.i.preheader
	vldr	d18, .LCPI8_2
.LBB8_2:                                @ %.lr.ph.i
                                        @ =>This Inner Loop Header: Depth=1
	vadd.f64	d16, d16, d18
	vcvt.f32.f64	s2, d16
	vcvt.f64.f32	d16, s2
	vcmpe.f64	d16, d17
	vmrs	APSR_nzcv, fpscr
	bgt	.LBB8_2
@ BB#3:                                 @ %._crit_edge.i
	vstr	s2, [r0, #12]
.LBB8_4:                                @ %_ZN14wave_generator14increment_waveEf.exit
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	bx	lr
	.p2align	3
@ BB#5:
.LCPI8_1:
	.long	1413754136              @ double 6.2831853071795862
	.long	1075388923
.LCPI8_2:
	.long	1413754136              @ double -6.2831853071795862
	.long	3222872571
.LCPI8_0:
	.long	1050868099              @ float 0.318309873
.Lfunc_end8:
	.size	_ZN14wave_generator8tick_sawEf, .Lfunc_end8-_ZN14wave_generator8tick_sawEf
	.fnend


	.globl	_ZN14wave_generatorC1Ef
	.type	_ZN14wave_generatorC1Ef,%function
_ZN14wave_generatorC1Ef = _ZN14wave_generatorC2Ef
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
