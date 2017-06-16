	.file	"prueba.c"
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	swap, .-swap
	.globl	decode1
	.type	decode1, @function
decode1:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	decode1, .-decode1
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -20(%rbp)
	movl	$2, -16(%rbp)
	movl	$3, -12(%rbp)
	leaq	-12(%rbp), %rdx
	leaq	-16(%rbp), %rcx
	leaq	-20(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	decode1
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Gentoo 4.9.3 p1.5, pie-0.6.4) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
