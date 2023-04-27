; use the execve syscall in order to spawn "/bin/sh"

; int execve(const char *pathname, char *const argv[], char *const envp[]); --> syscall # 11


section .data
	shell db "/bin/sh" 

section .text
	global _start

_start:
	; get registers cleared before syscall
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	mov eax, 11 ; execve == 11
	mov ebx, shell
	mov ecx, 0 ; char *const envp[] can be 0
	int 0x80

	; gracefull exit
	xor eax, eax
	xor ebx, ebx
	mov eax, 1 ; exit == 1
	mov ebx, 0 ; STATUS_success
	int 0x80
