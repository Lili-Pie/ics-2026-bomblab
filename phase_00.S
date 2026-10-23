
./bomb:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402cd0 <phase_00>:
  402cd0:	endbr64
  402cd4:	push   %rbp
  402cd5:	mov    %rsp,%rbp
  402cd8:	push   %r12
  402cda:	mov    %rdi,%r12
  402cdd:	push   %rbx
  402cde:	mov    %rsi,%rbx
  402ce1:	mov    $0x2,%esi
  402ce6:	sub    $0x10,%rsp
  402cea:	call   402bf0 <valid_u32_fields>
  402cef:	test   %al,%al
  402cf1:	jne    402d00 <phase_00+0x30>
  402cf3:	add    $0x10,%rsp
  402cf7:	xor    %eax,%eax
  402cf9:	pop    %rbx
  402cfa:	pop    %r12
  402cfc:	pop    %rbp
  402cfd:	ret
  402cfe:	xchg   %ax,%ax
  402d00:	xor    %eax,%eax
  402d02:	lea    -0x14(%rbp),%rcx
  402d06:	lea    -0x18(%rbp),%rdx
  402d0a:	mov    $0x40317f,%esi
  402d0f:	mov    %r12,%rdi
  402d12:	call   4011e0 <__isoc99_sscanf@plt>
  402d17:	cmp    $0x2,%eax
  402d1a:	jne    402cf3 <phase_00+0x23>
  402d1c:	shr    $0x5,%rbx
  402d20:	movzbl %bl,%edi
  402d23:	xor    $0x2a,%edi
  402d26:	cmp    %edi,-0x18(%rbp)
  402d29:	jne    402cf3 <phase_00+0x23>
  402d2b:	call   402cc0 <tutorial_mix>
  402d30:	cmp    %eax,-0x14(%rbp)
  402d33:	sete   %al
  402d36:	add    $0x10,%rsp
  402d3a:	pop    %rbx
  402d3b:	pop    %r12
  402d3d:	pop    %rbp
  402d3e:	ret

Disassembly of section .fini:
