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
	.file	"/root/Bela/projects/bucket-drums/build/distortion.bc"
	.globl	_Z15distortion_atanf
	.p2align	2
	.type	_Z15distortion_atanf,%function
_Z15distortion_atanf:                   @ @_Z15distortion_atanf
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.vsave	{d8}
	vpush	{d8}
	vldr	s16, .LCPI0_0
	bl	atanf
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmul.f32	d0, d0, d8
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	vpop	{d8}
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI0_0:
	.long	1059256707              @ float 0.636619746
.Lfunc_end0:
	.size	_Z15distortion_atanf, .Lfunc_end0-_Z15distortion_atanf
	.fnend

	.globl	_Z16distortion_clampf
	.p2align	2
	.type	_Z16distortion_clampf,%function
_Z16distortion_clampf:                  @ @_Z16distortion_clampf
	.fnstart
@ BB#0:
	vmov.f32	d2, #1.000000e+00
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vmov.f32	d16, #-1.000000e+00
	vcmpe.f32	s0, s4
	vmrs	APSR_nzcv, fpscr
	vmax.f32	d1, d0, d16
	vmovgt.f32	s2, s4
	vmov.f32	s0, s2
	bx	lr
.Lfunc_end1:
	.size	_Z16distortion_clampf, .Lfunc_end1-_Z16distortion_clampf
	.fnend


	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
