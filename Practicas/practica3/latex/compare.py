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
parser.add_option('-f', '--first', dest='first', help='first program')
parser.add_option('-s', '--second', dest='second', help='second program')
parser.add_option('-F', '--colorFirst', dest='color1', help='first color')
parser.add_option('-S', '--colorSecond', dest='color2', help='second color')
parser.add_option('-n', '--name', dest='name', help='output file name')
(options, args) = parser.parse_args()
if options.first is None:
	options.first = raw_input('Enter first program path: ')
if options.second is None:
	options.second = raw_input('Enter second program path: ')
titulo = raw_input('Graph title?')
if options.name is None:
	options.name = "grafico"
times1 = [] 
times2 = []
ind = [] 
ind2 = [] 
i = 1048476
while i < 1048576:
	start_time = time.time()
	os.system("./"+options.first + " %d > /dev/null" % (i))
	times1.append( (time.time() - start_time)) 

	start_time = time.time()
	os.system("./"+options.second + " %d > /dev/null" % (i))
	times2.append( (time.time() - start_time)) 
	ind.append(i)
	ind2.append(i+1)
	i = i+10 
plt.bar(ind,times1,5, align='center',color=options.color1)	
plt.bar(ind2,times2,5, align='center',color=options.color2)
plt.title(titulo)
plt.ylabel('Tiempo')
plt.xlabel('peso del algoritmo')
plt.savefig(options.name+'.png',bbox_inches='tight')

