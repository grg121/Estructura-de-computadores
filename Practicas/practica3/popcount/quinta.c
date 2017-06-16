#include <stdio.h>
#include <stdlib.h>

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  const int SIZE = 4 ;
unsigned long long size ; 

unsigned popcount5 (unsigned *array, int len)
{
  int i;
  unsigned val, result=0;
  int SSE_mask[] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f};
  int SSE_LUTb[] = {0x02010100, 0x03020201, 0x03020201, 0x04030302};
  //	3 2 1 0 	7 6 5 4 	1110 9 8	15141312

  if (len & 0x3)
    printf("leyendo 128b pero len no multiplo de 4?\n");

    for (i=0;i<len;i+=4)
      {
        asm("movdqu 	%[x], %%xmm0 	\n\t"
        "movdqa		%%xmm0, %%xmm1	\n\t"	// dos copias de x
        "movdqu 	%[m], %%xmm6	\n\t"	// mascara
        "psrlw		$4, %%xmm1 		\n\t"
        "pand 		%%xmm6, %%xmm0	\n\t"	//; xmm0 - nibbles inferiores
        "pand		%%xmm6, %%xmm1	\n\t"	//; xmm1 - nibbles superiores

        "movdqu		%[l], %%xmm2	\n\t"	//; ...como pshufb sobrescribe LUT
        "movdqa		%%xmm2, %%xmm3	\n\t"	//; ...queremos 2 copias
        "pshufb		%%xmm0,	%%xmm2	\n\t"	//; xmm2 = vector popcount inferiores
        "pshufb		%%xmm1,	%%xmm3	\n\t"	//; xmm3 = vector popcount superiores

        "paddb		%%xmm2, %%xmm3	\n\t"	//; xmm2 += xmm3 - vector popcount bytes
        "pxor		%%xmm0, %%xmm0	\n\t"	//; xmm0 = 0,0,0,0
        "psadbw		%%xmm0, %%xmm3	\n\t"	//; xmm3 = [pcnt bytes0..7|pcnt bytes8..15]
        "movhlps	%%xmm3,	%%xmm0	\n\t"	//; xmm0 = [	0 		  |pcnt bytes0..7]
        "paddd		%%xmm3,	%%xmm0	\n\t"	//; xmm0 = [	no usado  |pcnt bytes0..15]
        "movd 		%%xmm0, %[val]	\n\t"
        : [val]"=r" (val)
        : [x]  "m"	(array[i]),
        [m]  "m"	(SSE_mask[0]),
        [l]  "m"	(SSE_LUTb[0])
        );
        result += val;
      }

      return result;
}




int main(int argc, char * argv[]){

  if(argc == 2)
    size = atoi(argv[1]) ;
  else size = SIZE ; 
       
       unsigned lista[size] ;
       

       for(int i = 0 ; i < size ; i++)
	 lista[i] = i ;


      int resultado = popcount5(lista, size) ;

      printf("%d\n", resultado) ;
    }

      
    
