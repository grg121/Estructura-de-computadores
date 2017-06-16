#include <stdio.h>  // para printf
#include <stdlib.h> //para exit
#define WSIZE 8*sizeof(int)

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  

       unsigned long long size ; 

//unsigned lista[]={0x80000000, 0x001000000, 0x00000800,  0x00000001 } ;
////////////////// (1 uno,  1 uno, 1 uno, 1 uno ) 



  int pcount(unsigned * lista){
    
    long long i,x ;
    int j ; 
    unsigned result = 0, par = 0  ;
    for( i = 0 ; i < size ; i++){
      x = lista[i] ;
      par = 0 ; 
      for( j = 0 ; j < WSIZE ; j++) {
	unsigned mask = 1 << j ;
	par ^= (x & mask) != 0 ;
      } 
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

      
    


