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


parser = optparse.OptionParser()
parser.add_option('-f', '--filename', dest='name', help='output file name')

(options, args) = parser.parse_args()

if options.name is None:
	options.name = "grafico"

colors = ['black','red', 'blue', 'green', 'black', 'orange', 'yellow'] 
times = []
ind = [] 

i = 1048476
n = 1 
N = 4
while n <= N:
	times = []
	ind = [] 
	i = 1048476	
	while i < 1048576:
		start_time = time.time()
		os.system("./"+sys.argv[n]+ " %d > /dev/null" % (i))
		times.append( (time.time() - start_time)) 
		ind.append(i+n)		
		i = i+10
	plt.bar(ind,times,5, align='center',color=colors[n])
	n = n+1 
	

plt.title('Tiempos de las implementaciones')
plt.ylabel('Tiempo')
plt.xlabel('peso del algoritmo')


plt.savefig(options.name+'.png',bbox_inches='tight')


