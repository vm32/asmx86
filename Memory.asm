.global _start
.intel_syntax
.section .text

_start:
        mov dword ptr [%esp], 0x0a434241 #pointer

        mov %eax, 4 #write
        mov %ebx, 1 # 1 = stout
        mov %ecx, %esp
        mov %edx, 4 #len
        int 0x80

        #exit syscall 
        mov %eax, 1
        mov %ebx, 65
        int 0x80

.section .data
        message:
