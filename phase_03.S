
./bomb:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402230 <phase_03>:
  402230:	endbr64
  402234:	push   %rbp
  402235:	mov    %rsp,%rbp
  402238:	push   %r12
  40223a:	mov    %rsi,%r12
  40223d:	mov    $0x2,%esi
  402242:	push   %rbx
  402243:	mov    %rdi,%rbx
  402246:	sub    $0x10,%rsp
  40224a:	call   402bf0 <valid_u32_fields>
  40224f:	test   %al,%al
  402251:	jne    402260 <phase_03+0x30>
  402253:	xor    %eax,%eax
  402255:	add    $0x10,%rsp
  402259:	pop    %rbx
  40225a:	pop    %r12
  40225c:	pop    %rbp
  40225d:	ret
  40225e:	xchg   %ax,%ax
  402260:	xor    %eax,%eax
  402262:	lea    -0x14(%rbp),%rcx
  402266:	lea    -0x18(%rbp),%rdx
  40226a:	mov    $0x40317f,%esi
  40226f:	mov    %rbx,%rdi
  402272:	call   4011e0 <__isoc99_sscanf@plt>
  402277:	cmp    $0x2,%eax
  40227a:	jne    402253 <phase_03+0x23>
  40227c:	mov    %r12d,%edi
  40227f:	xor    %eax,%eax
  402281:	and    $0x7,%edi
  402284:	cmp    %edi,-0x18(%rbp)
  402287:	jne    402255 <phase_03+0x25>
  402289:	mov    %r12,%rax
  40228c:	mov    %r12,%rsi
  40228f:	shr    $0x3,%rax
  402293:	shr    $0x20,%rsi
  402297:	xor    %eax,%esi
  402299:	call   4021d0 <p3_dispatch>
  40229e:	cmp    %eax,-0x14(%rbp)
  4022a1:	sete   %al
  4022a4:	jmp    402255 <phase_03+0x25>

Disassembly of section .fini:
