void swap(int *a, int *b){
  int aux = *a ;
  *a = *b ;
  *b = aux ; 
}

void decode1(int *xp, int *yp, int *zp){
  swap(*xp,*zp) ;
  swap(*zp,*yp) ;
}

int main(){
  int x = 1 ;
  int y = 2 ;
  int z = 3 ;

  decode1(&x,&y,&z) ;

}
