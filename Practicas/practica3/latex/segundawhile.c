#include <stdio.h>  // para printf
#include <stdlib.h> //para exit
#define WSIZE 8*sizeof(int)

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  const int SIZE = 4 ;  
unsigned long long size; 

int pcount(unsigned * lista){
    
    unsigned i = 0 ;
    unsigned x = 0 ;
    unsigned result = 0 ; 
    
    for( i = 0 ; i < size ; i++){
      x = lista[i] ; 
      while(x){
	result += x & 0x1 ;
	x >>= 1 ;
	
    }
    }
    return result ;

  }

int main(int argc, char * argv[]){

  if(argc == 2)
    size = atoi(argv[1]) ;
  else size = SIZE ; 
  
  
       unsigned lista[size] ;
       

       for(int i = 0 ; i < size ; i++)
	 lista[i] = i ;


      int resultado = pcount(lista) ;

      printf("%d\n", resultado) ;
    }

      
    


