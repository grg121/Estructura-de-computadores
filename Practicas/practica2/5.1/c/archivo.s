
sumac:     file format elf64-x86-64


Disassembly of section .init:

0000000000400458 <_init>:
  400458:	48 83 ec 08          	sub    $0x8,%rsp
  40045c:	48 8b 05 95 0b 20 00 	mov    0x200b95(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  400463:	48 85 c0             	test   %rax,%rax
  400466:	74 05                	je     40046d <_init+0x15>
  400468:	e8 53 00 00 00       	callq  4004c0 <__gmon_start__@plt>
  40046d:	48 83 c4 08          	add    $0x8,%rsp
  400471:	c3                   	retq   

Disassembly of section .plt:

0000000000400480 <__stack_chk_fail@plt-0x10>:
  400480:	ff 35 82 0b 20 00    	pushq  0x200b82(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400486:	ff 25 84 0b 20 00    	jmpq   *0x200b84(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40048c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400490 <__stack_chk_fail@plt>:
  400490:	ff 25 82 0b 20 00    	jmpq   *0x200b82(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400496:	68 00 00 00 00       	pushq  $0x0
  40049b:	e9 e0 ff ff ff       	jmpq   400480 <_init+0x28>

00000000004004a0 <printf@plt>:
  4004a0:	ff 25 7a 0b 20 00    	jmpq   *0x200b7a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4004a6:	68 01 00 00 00       	pushq  $0x1
  4004ab:	e9 d0 ff ff ff       	jmpq   400480 <_init+0x28>

00000000004004b0 <__libc_start_main@plt>:
  4004b0:	ff 25 72 0b 20 00    	jmpq   *0x200b72(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4004b6:	68 02 00 00 00       	pushq  $0x2
  4004bb:	e9 c0 ff ff ff       	jmpq   400480 <_init+0x28>

00000000004004c0 <__gmon_start__@plt>:
  4004c0:	ff 25 6a 0b 20 00    	jmpq   *0x200b6a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  4004c6:	68 03 00 00 00       	pushq  $0x3
  4004cb:	e9 b0 ff ff ff       	jmpq   400480 <_init+0x28>

Disassembly of section .text:

00000000004004d0 <_start>:
  4004d0:	31 ed                	xor    %ebp,%ebp
  4004d2:	49 89 d1             	mov    %rdx,%r9
  4004d5:	5e                   	pop    %rsi
  4004d6:	48 89 e2             	mov    %rsp,%rdx
  4004d9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004dd:	50                   	push   %rax
  4004de:	54                   	push   %rsp
  4004df:	49 c7 c0 30 07 40 00 	mov    $0x400730,%r8
  4004e6:	48 c7 c1 c0 06 40 00 	mov    $0x4006c0,%rcx
  4004ed:	48 c7 c7 10 06 40 00 	mov    $0x400610,%rdi
  4004f4:	e8 b7 ff ff ff       	callq  4004b0 <__libc_start_main@plt>
  4004f9:	f4                   	hlt    
  4004fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400500:	b8 4f 10 60 00       	mov    $0x60104f,%eax
  400505:	55                   	push   %rbp
  400506:	48 2d 48 10 60 00    	sub    $0x601048,%rax
  40050c:	48 83 f8 0e          	cmp    $0xe,%rax
  400510:	48 89 e5             	mov    %rsp,%rbp
  400513:	76 1b                	jbe    400530 <_start+0x60>
  400515:	b8 00 00 00 00       	mov    $0x0,%eax
  40051a:	48 85 c0             	test   %rax,%rax
  40051d:	74 11                	je     400530 <_start+0x60>
  40051f:	5d                   	pop    %rbp
  400520:	bf 48 10 60 00       	mov    $0x601048,%edi
  400525:	ff e0                	jmpq   *%rax
  400527:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40052e:	00 00 
  400530:	5d                   	pop    %rbp
  400531:	c3                   	retq   
  400532:	0f 1f 40 00          	nopl   0x0(%rax)
  400536:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40053d:	00 00 00 
  400540:	be 48 10 60 00       	mov    $0x601048,%esi
  400545:	55                   	push   %rbp
  400546:	48 81 ee 48 10 60 00 	sub    $0x601048,%rsi
  40054d:	48 c1 fe 03          	sar    $0x3,%rsi
  400551:	48 89 e5             	mov    %rsp,%rbp
  400554:	48 89 f0             	mov    %rsi,%rax
  400557:	48 c1 e8 3f          	shr    $0x3f,%rax
  40055b:	48 01 c6             	add    %rax,%rsi
  40055e:	48 d1 fe             	sar    %rsi
  400561:	74 15                	je     400578 <_start+0xa8>
  400563:	b8 00 00 00 00       	mov    $0x0,%eax
  400568:	48 85 c0             	test   %rax,%rax
  40056b:	74 0b                	je     400578 <_start+0xa8>
  40056d:	5d                   	pop    %rbp
  40056e:	bf 48 10 60 00       	mov    $0x601048,%edi
  400573:	ff e0                	jmpq   *%rax
  400575:	0f 1f 00             	nopl   (%rax)
  400578:	5d                   	pop    %rbp
  400579:	c3                   	retq   
  40057a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400580:	80 3d c1 0a 20 00 00 	cmpb   $0x0,0x200ac1(%rip)        # 601048 <__TMC_END__>
  400587:	75 11                	jne    40059a <_start+0xca>
  400589:	55                   	push   %rbp
  40058a:	48 89 e5             	mov    %rsp,%rbp
  40058d:	e8 6e ff ff ff       	callq  400500 <_start+0x30>
  400592:	5d                   	pop    %rbp
  400593:	c6 05 ae 0a 20 00 01 	movb   $0x1,0x200aae(%rip)        # 601048 <__TMC_END__>
  40059a:	f3 c3                	repz retq 
  40059c:	0f 1f 40 00          	nopl   0x0(%rax)
  4005a0:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  4005a5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4005a9:	75 05                	jne    4005b0 <_start+0xe0>
  4005ab:	eb 93                	jmp    400540 <_start+0x70>
  4005ad:	0f 1f 00             	nopl   (%rax)
  4005b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4005b5:	48 85 c0             	test   %rax,%rax
  4005b8:	74 f1                	je     4005ab <_start+0xdb>
  4005ba:	55                   	push   %rbp
  4005bb:	48 89 e5             	mov    %rsp,%rbp
  4005be:	ff d0                	callq  *%rax
  4005c0:	5d                   	pop    %rbp
  4005c1:	e9 7a ff ff ff       	jmpq   400540 <_start+0x70>

00000000004005c6 <suma>:
  4005c6:	55                   	push   %rbp
  4005c7:	48 89 e5             	mov    %rsp,%rbp
  4005ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4005ce:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  4005d1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  4005d8:	00 
  4005d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  4005e0:	eb 20                	jmp    400602 <suma+0x3c>
  4005e2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4005e5:	48 98                	cltq   
  4005e7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4005ee:	00 
  4005ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4005f3:	48 01 d0             	add    %rdx,%rax
  4005f6:	8b 00                	mov    (%rax),%eax
  4005f8:	89 c0                	mov    %eax,%eax
  4005fa:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  4005fe:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  400602:	8b 45 f4             	mov    -0xc(%rbp),%eax
  400605:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  400608:	7c d8                	jl     4005e2 <suma+0x1c>
  40060a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40060e:	5d                   	pop    %rbp
  40060f:	c3                   	retq   

0000000000400610 <main>:
  400610:	55                   	push   %rbp
  400611:	48 89 e5             	mov    %rsp,%rbp
  400614:	48 83 ec 50          	sub    $0x50,%rsp
  400618:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40061f:	00 00 
  400621:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400625:	31 c0                	xor    %eax,%eax
  400627:	c7 45 bc 0b 00 00 00 	movl   $0xb,-0x44(%rbp)
  40062e:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%rbp)
  400635:	c7 45 c4 02 00 00 00 	movl   $0x2,-0x3c(%rbp)
  40063c:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
  400643:	c7 45 cc 04 00 00 00 	movl   $0x4,-0x34(%rbp)
  40064a:	c7 45 d0 05 00 00 00 	movl   $0x5,-0x30(%rbp)
  400651:	c7 45 d4 06 00 00 00 	movl   $0x6,-0x2c(%rbp)
  400658:	c7 45 d8 07 00 00 00 	movl   $0x7,-0x28(%rbp)
  40065f:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%rbp)
  400666:	c7 45 e0 09 00 00 00 	movl   $0x9,-0x20(%rbp)
  40066d:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  400674:	c7 45 e8 0b 00 00 00 	movl   $0xb,-0x18(%rbp)
  40067b:	8b 55 bc             	mov    -0x44(%rbp),%edx
  40067e:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  400682:	89 d6                	mov    %edx,%esi
  400684:	48 89 c7             	mov    %rax,%rdi
  400687:	e8 3a ff ff ff       	callq  4005c6 <suma>
  40068c:	48 89 c6             	mov    %rax,%rsi
  40068f:	bf 44 07 40 00       	mov    $0x400744,%edi
  400694:	b8 00 00 00 00       	mov    $0x0,%eax
  400699:	e8 02 fe ff ff       	callq  4004a0 <printf@plt>
  40069e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  4006a2:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4006a9:	00 00 
  4006ab:	74 05                	je     4006b2 <main+0xa2>
  4006ad:	e8 de fd ff ff       	callq  400490 <__stack_chk_fail@plt>
  4006b2:	c9                   	leaveq 
  4006b3:	c3                   	retq   
  4006b4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006bb:	00 00 00 
  4006be:	66 90                	xchg   %ax,%ax

00000000004006c0 <__libc_csu_init>:
  4006c0:	41 57                	push   %r15
  4006c2:	41 56                	push   %r14
  4006c4:	41 89 ff             	mov    %edi,%r15d
  4006c7:	41 55                	push   %r13
  4006c9:	41 54                	push   %r12
  4006cb:	4c 8d 25 3e 07 20 00 	lea    0x20073e(%rip),%r12        # 600e10 <__init_array_start>
  4006d2:	55                   	push   %rbp
  4006d3:	48 8d 2d 3e 07 20 00 	lea    0x20073e(%rip),%rbp        # 600e18 <__init_array_end>
  4006da:	53                   	push   %rbx
  4006db:	49 89 f6             	mov    %rsi,%r14
  4006de:	49 89 d5             	mov    %rdx,%r13
  4006e1:	31 db                	xor    %ebx,%ebx
  4006e3:	4c 29 e5             	sub    %r12,%rbp
  4006e6:	48 83 ec 08          	sub    $0x8,%rsp
  4006ea:	48 c1 fd 03          	sar    $0x3,%rbp
  4006ee:	e8 65 fd ff ff       	callq  400458 <_init>
  4006f3:	48 85 ed             	test   %rbp,%rbp
  4006f6:	74 1e                	je     400716 <__libc_csu_init+0x56>
  4006f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4006ff:	00 
  400700:	4c 89 ea             	mov    %r13,%rdx
  400703:	4c 89 f6             	mov    %r14,%rsi
  400706:	44 89 ff             	mov    %r15d,%edi
  400709:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40070d:	48 83 c3 01          	add    $0x1,%rbx
  400711:	48 39 eb             	cmp    %rbp,%rbx
  400714:	75 ea                	jne    400700 <__libc_csu_init+0x40>
  400716:	48 83 c4 08          	add    $0x8,%rsp
  40071a:	5b                   	pop    %rbx
  40071b:	5d                   	pop    %rbp
  40071c:	41 5c                	pop    %r12
  40071e:	41 5d                	pop    %r13
  400720:	41 5e                	pop    %r14
  400722:	41 5f                	pop    %r15
  400724:	c3                   	retq   
  400725:	90                   	nop
  400726:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40072d:	00 00 00 

0000000000400730 <__libc_csu_fini>:
  400730:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400734 <_fini>:
  400734:	48 83 ec 08          	sub    $0x8,%rsp
  400738:	48 83 c4 08          	add    $0x8,%rsp
  40073c:	c3                   	retq   
