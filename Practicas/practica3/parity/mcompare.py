#!/usr/bin/python 
import sys
import optparse
import subprocess
import time
import os
import matplotlib
import numpy as np

from matplotlib import pyplot as plt
from matplotlib import style 
style.use('ggplot')

name = "segunda -O0, -O1 y -O2" 



colors = ['#000000','#111111', '#222222', '#333333', 'black', 'orange', 'yellow'] 
times = []
ind = [] 

i = 1048476
n = 1 

N = raw_input('numero de programas: ')
while n <= N:
	times = []
	ind = [] 
	i = 1048476	
	while i < 1048576:
		start_time = time.time()
		os.system("./"+sys.argv[1]+ " %d > /dev/null" % (i))
		times.append( (time.time() - start_time)) 
		ind.append(i+n)		
		i = i+10
	plt.bar(ind,times,5, align='center',color=colors[n])
	n = n+1 
	

plt.title('Tiempos de las implementaciones')
plt.ylabel('Tiempo')
plt.xlabel('peso del algoritmo')


plt.savefig(name+'.png',bbox_inches='tight')


