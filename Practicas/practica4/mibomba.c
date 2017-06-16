#include <stdio.h>	// para printf()
#include <stdlib.h>	// para exit()
#include <string.h>	// para strncmp()/strlen()
#include <sys/time.h>	// para gettimeofday(), struct timeval

char encriptada[]="*root*\n";
int  passcode  = 1010;

void boom(){
	printf("***************\n");
	printf("*** BOOM!!! ***\n");
	printf("***************\n");
	exit(-1);
}

void defused(){
	printf("*************************\n");
	printf("*** bomba desactivada ***\n");
	printf("*************************\n");
	exit(0);
}

int main(){
  

#define SIZE 100
	char password[SIZE];
	int  pasv;
#define TLIM 15
	struct timeval tv1,tv2;	// gettimeofday() secs-usecs

	gettimeofday(&tv1,NULL);

	printf("Introduce la contraseña: ");
	fgets(password,SIZE,stdin);


    int i = 0 ;
  while( i < strlen(password) - 2 ){
    if ( password[i] != password[i+1] ) 
      password[i] = password[i+1] ;
    else
      password[i] = password[i+2] ;
    i++ ; 
  }

  password[0] = password[0] - 10 ; 
  password[i] = password[i] - 74 ;

	
	if (strncmp(encriptada,password,strlen(password)))
	    boom();

	gettimeofday(&tv2,NULL);
	if (tv2.tv_sec - tv1.tv_sec > TLIM)
	    boom();

	printf("Introduce el código: ");
	scanf("%lld",&pasv);
      	unsigned long aux = (unsigned) ( (long) pasv) ;
	pasv = (int) aux ;
	
	if (pasv!=passcode) boom();

	gettimeofday(&tv1,NULL);
	if (tv1.tv_sec - tv2.tv_sec > TLIM)
	    boom();

	defused();

}
