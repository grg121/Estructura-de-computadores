#!/bin/bash

#gnuplot -e "set terminal png size 1300, 900 ; 
#	set title 'gradico1' ;
#        set output 'grafico1.png' ; plot 'salida1' with points pointtype 3" 
#gnuplot -e "set terminal png size 1300, 900 ; 
#	set title 'Tiempo' ;
#        set output 'grafico2.png' ; plot [0:30000]'salida2',x*x  with points pointtype 3"  
#
#gnuplot -e "set terminal png size 1300, 900 ; 
#	set output 'grafico3.png' ; 
#	f(x)=a*x**2+b*x+c ; fit f(x) 'tiempos_burbuja' via a,b,c ; 
#	plot 'tiempos_burbuja', f(x)" 


gnuplot -e "
	set boxwidth 0.5 ; 
	set style fill solid ; 
	set terminal png size 1300, 900 ; 
	set output 'grafico1.png' ;
	mycolor(x) = ((x*11244898) + 2851770) ; 
	plot 'data.dat' using 1:3:xtic(2) with boxes ls 1"


