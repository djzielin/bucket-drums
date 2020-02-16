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
	.file	"/root/Bela/projects/bucket-drums/build/old/wave_position.bc"
	.globl	_ZN13wave_positionC2Ev
	.p2align	2
	.type	_ZN13wave_positionC2Ev,%function
_ZN13wave_positionC2Ev:                 @ @_ZN13wave_positionC2Ev
	.fnstart
@ BB#0:
	mov	r1, #0
	str	r1, [r0]
	str	r1, [r0, #4]
	bx	lr
.Lfunc_end0:
	.size	_ZN13wave_positionC2Ev, .Lfunc_end0-_ZN13wave_positionC2Ev
	.fnend

	.globl	_ZN13wave_position5resetEv
	.p2align	2
	.type	_ZN13wave_position5resetEv,%function
_ZN13wave_position5resetEv:             @ @_ZN13wave_position5resetEv
	.fnstart
@ BB#0:
	mov	r1, #0
	str	r1, [r0]
	str	r1, [r0, #4]
	bx	lr
.Lfunc_end1:
	.size	_ZN13wave_position5resetEv, .Lfunc_end1-_ZN13wave_position5resetEv
	.fnend

	.globl	_ZN13wave_positionD2Ev
	.p2align	2
	.type	_ZN13wave_positionD2Ev,%function
_ZN13wave_positionD2Ev:                 @ @_ZN13wave_positionD2Ev
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	mov	r4, r0
	movw	r0, :lower16:.Lstr
	movt	r0, :upper16:.Lstr
	bl	puts
	mov	r0, r4
	pop	{r4, r10, r11, pc}
.Lfunc_end2:
	.size	_ZN13wave_positionD2Ev, .Lfunc_end2-_ZN13wave_positionD2Ev
	.fnend

	.globl	_ZN13wave_position9incrementEf
	.p2align	2
	.type	_ZN13wave_position9incrementEf,%function
_ZN13wave_position9incrementEf:         @ @_ZN13wave_position9incrementEf
	.fnstart
@ BB#0:
	vldr	s2, [r0, #4]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
	vadd.f32	d16, d1, d0
	vcvt.u32.f32	d0, d16
	vcvt.f32.u32	d17, d0
	vmov	r1, s0
	vsub.f32	d0, d16, d17
	vstr	s0, [r0, #4]
	ldr	r2, [r0]
	add	r1, r2, r1
	str	r1, [r0]
	bx	lr
.Lfunc_end3:
	.size	_ZN13wave_position9incrementEf, .Lfunc_end3-_ZN13wave_position9incrementEf
	.fnend

	.type	.Lstr,%object           @ @str
	.section	.rodata.str1.16,"aMS",%progbits,1
	.p2align	4
.Lstr:
	.asciz	"we are in wave_position destructor"
	.size	.Lstr, 35


	.globl	_ZN13wave_positionC1Ev
	.type	_ZN13wave_positionC1Ev,%function
_ZN13wave_positionC1Ev = _ZN13wave_positionC2Ev
	.globl	_ZN13wave_positionD1Ev
	.type	_ZN13wave_positionD1Ev,%function
_ZN13wave_positionD1Ev = _ZN13wave_positionD2Ev
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
