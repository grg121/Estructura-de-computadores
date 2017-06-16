#include <stdio.h>  // para printf
#include <stdlib.h> //para exit
#define WSIZE 8*sizeof(int)

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  

       unsigned long long size ; 

//unsigned lista[]={0x80000000, 0x0010000, 0x00000800, 0x00000001 } ;
////////////////// (1 uno,  1 uno, 1 uno, 1 uno ) 



  int pcount_for(unsigned * lista){
    
    long long i,x ;
    int j ; 
    int result = 0 ;
    
    for( i = 0 ; i < size ; i++){
      x = lista[i] ; 
    for( j = 0 ; j < WSIZE ; j++) {
      unsigned mask = 1 << j ;
      result += (x & mask) != 0 ;
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

      int resultado = pcount_for(lista) ;

      printf("%d\n", resultado) ;
    }

      
    


