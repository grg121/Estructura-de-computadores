 
	# suma.s: sumar los elementos de una lista
	#
	# retorna: código retorno 0, comprobar suma en %eax mediante gdb/ddd

	# SECCIÓN DE DATOS (.data, variables globales inicializadas)

	.section .data
lista:
	.int 1,2,10, 1,2,0b10, 1,2,0x10

longlista:
	.int (.-lista)/4

resultado:
	.int 0x01234567

	# SECCIÓN DE CÓDIGO (.text, instrucciones máquina)

	.section .text
_start:	.global _start # PROGRAMA PRINCIPAL

	pushl longlista	# 2º  arg: número de elementos a sumar
	pushl $lista 	# 1er arg: dirección del array lista
	call suma 	# llamar a suma(&lista, longlista)
	add $8, %esp	# Quitar args 	
	mov %eax, resultado

	mov $1, %eax
	mov $0, %ebx
	int $0x80

	# SUBRUTINA Int suma(int* lista, int longlista) ;
	# entrada: 1) %ebx = dirección inicio array
	#	   2) %ecx = número de elementos a sumar
	#
	# salida:     %eax = resultado de la suma

suma:
	push %ebp
	mov %esp, %ebp

	push %ebx
	mov 8(%ebp), %ebx
	mov 12(%ebp), %ecx
	
	mov $0, %eax
	mov $0, %edx

bucle:
	add (%ebx, %edx, 4), %eax
	inc %edx
	cmp %edx, %ecx
	jne bucle

	pop %ebx
	pop %ebp
	ret

	
