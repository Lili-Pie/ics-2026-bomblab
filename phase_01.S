
./bomb:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402020 <phase_01>:
  402020:	endbr64
  402024:	push   %rbp
  402025:	mov    %rsp,%rbp
  402028:	push   %r12
  40202a:	mov    %rsi,%r12
  40202d:	mov    $0x1,%esi                  //rsi = 1
  402032:	push   %rbx
  402033:	mov    %rdi,%rbx
  402036:	sub    $0x10,%rsp
  40203a:	call   402bf0 <valid_u32_fields>
  40203f:	test   %al,%al
  402041:	jne    402050 <phase_01+0x30>
  402043:	add    $0x10,%rsp                 
  402047:	xor    %eax,%eax
  402049:	pop    %rbx
  40204a:	pop    %r12
  40204c:	pop    %rbp
  40204d:	ret
  40204e:	xchg   %ax,%ax
  402050:	xor    %eax,%eax
  402052:	lea    -0x14(%rbp),%rdx
  402056:	mov    $0x403182,%esi                //esi = 0x403182
  40205b:	mov    %rbx,%rdi
  40205e:	call   4011e0 <__isoc99_sscanf@plt>
  402063:	cmp    $0x1,%eax                    //cmp
  402066:	jne    402043 <phase_01+0x23>       //if (%eax != 1) goto 402043
  402068:	mov    %r12,%rdi
  40206b:	call   401fe0 <p1_compute>
  402070:	cmp    %eax,-0x14(%rbp)
  402073:	sete   %al
  402076:	add    $0x10,%rsp
  40207a:	pop    %rbx
  40207b:	pop    %r12
  40207d:	pop    %rbp
  40207e:	ret

Disassembly of section .fini:
