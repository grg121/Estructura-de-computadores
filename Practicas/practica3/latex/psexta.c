#include <stdio.h>  // para printf
#include <stdlib.h> //para exit

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  
unsigned long long size ;  

  int pcount(unsigned * lista){
    
    unsigned i = 0, j = 0 ;
    unsigned x = 0 ;
    unsigned result = 0 ;
    
    for( i = 0 ; i < size ; i++){
      x = lista[i] ;
      asm("\n"
	"mov %[x], %%edx		\n\t"
	"shr $16, %[x]			\n\t"
	"xor %[x], %%edx		\n\t"
	"xor %%dh, %%dl			\n\t"
	"setpo %%dl			\n\t"
	"movzx %%dl, %[x]		\n\t"
	:[x]"+r"(x)
	:
	:"edx"
	) ; 
     
	result += x ; 
    }
    return result ;
  }



int main(int argc, char * argv[]){

  if(argc == 2)
    size = atoi(argv[1]) ;
  else size = SIZE ; 
       
       unsigned lista[size] ;
       
  
       for(int i = 0 ; i < size ; i+=4){
	 lista[i]   = 0x80000000  ;
         lista[i+1] = 0x00100000  ; 
	 lista[i+2] = 0x00000800  ; 
	 lista[i+3] = 0x00000001  ; 
       }
       
      int resultado = pcount(lista) ;

      printf("%d\n", resultado) ;
    }

      
    


