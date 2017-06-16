 
   # Suma.s

  .section .data
	  .macro linea # (tal y como se indica en el guión)
	        #.int 0xFC000000, 0xFC000000, 0xFC000000, 0xFC000000
	        #.int 1,1,1,1
	        .int 2,2,2,2
	        #.int 1,2,3,4
	        #.int -1,-1,-1,-1
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

  /**
   ** $eax contiene la parte más significativa de resultado,
   ** %edx la menos significativa. Para concatenar %eax y %ebx
   ** en resultado movemos la parte más significativa a resultado
   ** y luego la menos significativa 4B por delante (resultado + 4 )
   ** Como no existe push de 64 bits, tenemos que hacer dos push para
   ** meter resultado en la pila, como además el formato de printf
   ** requiere que resultado esté dos veces en la pila, hacemos un
   ** total de 4 push. Push del formato  y finalmente llamamos a printf.
   ** tras ejecutar printf hay que retirar las dos instancias de resultado
   ** y el formato de la pila, como esto ocupa 12 Bytes (4B cada dato) hacemos
   ** add $12 al puntero de la pila %esp
  **/

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
    * cargamos %esi en pila para conservar su valor
    * ponemos a 0 los registros que vamos a usar: %eax y %edx para resultado
    * %esi será el índice de lectura
  **/ 
suma:
  push %esi
  mov $0, %edx
  mov $0, %esi
  mov $0, %eax


  /**
   * suma el elemento numero  %esi del array apuntado por %ebx en %eax
   * comprueba si hay acarreo, si no lo hay salta la siguiente instrucción.
   * En caso de que sí haya acarreo, incremente %edx
  **/
bucle:
  add (%ebx, %esi, 4), %eax
  jnc bucle+4 
  inc %edx

  /**
   * incrementa el indice de lectura y lo compara con %ecx,
   * que tiene el total de iteraciones si coincide, jne no
   * tiene efecto y se continua por la instrucción pop %esi,
   * si no coincide se repite el bucle (salta a la etiqueta bucle)
   * Pop %esi recupera el valor que tenía el registro
  **/ 
  inc %esi
  cmp %esi, %ecx
  jne bucle

  pop %esi
  ret
  // retorno de ejecución a la siguiente instrucción a call suma.
