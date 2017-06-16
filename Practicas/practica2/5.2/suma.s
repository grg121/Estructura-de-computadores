  # Suma.s

  .section .data
	  .macro linea # (tal y como se indica en el guión)
	        #.int 0xFC000000, 0xFC000000, 0xFC000000, 0xFC000000
	        #.int 1,1,1,1
	        #.int 2,2,2,2
	        #.int 1,2,3,4
	        #.int -1,-1,-1,-1
		 .int 1,-2,1,-2
	  .endm

lista:   .irpc i,12345678
	  linea
	  .endr

longlista:   .int (.-lista)/4

resultado:   .quad 0x0123456789ABCDEF

	#  FE CD AB 89 67 45 23 01 
	# 100 101 102..... (little endian)
  #asigna a los menos significativos posiciones de memoria menores

formato: .ascii "suma = %lld = %llx \n\0"


  .section .text

main: .global main

  /** ebx es el puntero al array (primera posición)
   ** ecx es una especie de "total utilizados" del array
   ** call suma llama a la función y guarda la dirección
   ** de la siguiente instrucción en stack
  */

  mov $lista, %ebx
  mov longlista, %ecx
  call suma


  mov %eax, resultado
  mov %edx, resultado+4
  push resultado+4
  push resultado
  push resultado+4
  push resultado
  push $formato
  call printf
  add $12, %esp
  //  Preparamos la salida, return(0) y llamamos a la subrutina adecuada

  mov $1, %eax
  mov $0, %ebx
  int $0x80


  /**
    * ponemos a 0 los registros que vamos a usar: %eax y %edx para resultado
    * %esi será el índice de lectura
  **/
suma:
  mov $0, %edx
  mov $0, %esi
  mov $0, %edi
  mov $0, %eax
  dec %ecx


  /**
   * (se suma de la posición %ecx -1 a la 0, restando)
   * pone el elemento numero  %ecx del array apuntado por %ebx
   * en %eax, extiende el signo de %eax en %edx:%eax y después
   * mueve %eax a %esi y %edx a %edi
   * resultado = %edi:%esi
  **/
bucle:
  mov (%ebx,%ecx,4), %eax
  cdq
  // extensión de signo de %eax en %edx:%eax
  add %eax, %esi
  adc %edx, %edi
  cmp $0, %ecx
  je zero
  dec %ecx
  jmp bucle

zero:
  mov %esi, %eax
  mov %edi, %edx 
  ret
  // retorno de ejecución a la siguiente instrucción a call suma.
