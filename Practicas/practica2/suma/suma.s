.section .data
  .macro linea
  .int 1,1,1,1
  .endm

  lista: .irpc i, 1234567B
  linea
  .endr

longlista:	.int (.-lista)/4
resultado:	.quad 1

.section .text
_start:	.global _start

	mov    $lista, %ebx
	mov longlista, %ecx
	call suma
	mov %eax, resultado

	mov $1, %eax
	mov $0, %ebx
	int $0x80

suma:
	push %esi
  mov $0, %esi
	mov $0, %eax
	mov $0, %edx
bucle:
	add (%ebx,%edx,4), %eax
  jnc 2
  inc %edx
	inc       %edx
	cmp  %edx,%ecx
	jne bucle

	pop %edx
	ret
