.section .multiboot
    .align 4
    .long 0x1BADB002             /* Multiboot magic number */
    .long 0x00000003             /* Flags */
    .long -(0x1BADB002 + 0x00000003) /* Checksum */

.section .text
.extern kernelMain

.global loader

loader:
    mov $kernel_stack + 2*1024*1024, %esp
    push %eax
    push %ebx
    call kernelMain
    jmp _stop

_stop:
    cli
    hlt
    jmp _stop 

.section .bss
.space 2*1024*1024
kernel_stack:
