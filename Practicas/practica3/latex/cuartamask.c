#include <stdio.h>
#include <stdlib.h>

const unsigned long long SIZE = 1048576  ; // 2 elevado a 20  const int SIZE = 4 ;
unsigned long long size ; 

int pcount(unsigned *lista){

  unsigned i,j; 
  unsigned x = 0 ;
  unsigned result ;
  unsigned val = 0 ;  
  
  for(i = 0 ; i < size ; i++){
    x = lista[i] ;
    for( j = 0 ; j < 8 ; j++){
      		val    += x & 0x01010101 ;
      		x >>= 1;
	}
    val += (val >> 16) ;
    val += (val >> 8 ) ;

    result += (val & 0xFF ) ;
    val = 0 ;
  }                             
  return result;             ; 
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

      
    
