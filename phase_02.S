
./bomb:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402080 <phase_02>:
  402080:	endbr64
  402084:	push   %rbp
  402085:	mov    %rsp,%rbp
  402088:	push   %r13
  40208a:	mov    %rsi,%r13
  40208d:	mov    $0x6,%esi
  402092:	push   %r12
  402094:	mov    %rdi,%r12
  402097:	push   %rbx
  402098:	sub    $0x28,%rsp
  40209c:	call   402bf0 <valid_u32_fields>
  4020a1:	test   %al,%al
  4020a3:	jne    4020b8 <phase_02+0x38>
  4020a5:	xor    %ebx,%ebx
  4020a7:	lea    -0x18(%rbp),%rsp
  4020ab:	mov    %ebx,%eax
  4020ad:	pop    %rbx
  4020ae:	pop    %r12
  4020b0:	pop    %r13
  4020b2:	pop    %rbp
  4020b3:	ret
  4020b4:	nopl   0x0(%rax)
  4020b8:	mov    %eax,%ebx
  4020ba:	lea    -0x2c(%rbp),%rax
  4020be:	lea    -0x3c(%rbp),%rcx
  4020c2:	mov    $0x403173,%esi
  4020c7:	push   %rax
  4020c8:	lea    -0x30(%rbp),%rax
  4020cc:	lea    -0x40(%rbp),%rdx
  4020d0:	mov    %r12,%rdi
  4020d3:	push   %rax
  4020d4:	lea    -0x34(%rbp),%r9
  4020d8:	lea    -0x38(%rbp),%r8
  4020dc:	xor    %eax,%eax
  4020de:	call   4011e0 <__isoc99_sscanf@plt>
  4020e3:	pop    %rdx
  4020e4:	pop    %rcx
  4020e5:	cmp    $0x6,%eax
  4020e8:	jne    4020a5 <phase_02+0x25>
  4020ea:	mov    %r13,%rax
  4020ed:	mov    -0x40(%rbp),%esi
  4020f0:	shr    $0x9,%rax
  4020f4:	and    $0x7f,%eax
  4020f7:	lea    (%rax,%rax,2),%eax
  4020fa:	cmp    %eax,%esi
  4020fc:	jne    4020a5 <phase_02+0x25>
  4020fe:	mov    $0x1,%edx
  402103:	lea    0xc(%rdx),%ecx
  402106:	mov    %r13,%rax
  402109:	shr    %cl,%rax
  40210c:	lea    0xf(%rdx),%ecx
  40210f:	and    $0x1f,%eax
  402112:	xor    %ecx,%eax
  402114:	lea    (%rsi,%rsi,4),%ecx
  402117:	mov    -0x40(%rbp,%rdx,4),%esi
  40211b:	add    %ecx,%eax
  40211d:	cmp    %eax,%esi
  40211f:	jne    4020a5 <phase_02+0x25>
  402121:	add    $0x1,%rdx
  402125:	cmp    $0x6,%rdx
  402129:	jne    402103 <phase_02+0x83>
  40212b:	jmp    4020a7 <phase_02+0x27>

Disassembly of section .fini:
