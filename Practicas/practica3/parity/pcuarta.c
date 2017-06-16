#include <stdio.h>  // para printf
#include <stdlib.h> //para exit

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  
unsigned long long size ;  

  int pcount(unsigned * lista){
    
    unsigned i = 0 ;
    unsigned x = 0 ;
    unsigned result = 0 ;
    unsigned par = 0 ;  
    
    for( i = 0 ; i < size ; i++){
      x = lista[i] ;
      par = 0 ; 
   asm("\n"
	"ini3%=:                      \n\t"
	"xor %[x],%[par]            \n\t"
	"shr %[x]                   \n\t"
	"test %[x], %[x]            \n\t"
	"jnz ini3%=                   \n\t"
	"and $1, %[par]             \n\t" 
	: [par]"+r" (par) 
	: [x]"r" (x) 
	) ; 
   
    result += par ; 
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

      
    


