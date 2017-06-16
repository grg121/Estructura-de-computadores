#!/usr/bin/python 

import sys
import optparse

parse = optparse.OptionParser()
parser.add_option('-f', '--first', dest='first', help='first program')
parser.add_option('-s', '--second', dest='second', help='second program') 

(options, args) = parser.parse_args()

if options.first is None:
	options.first = raw_input('Enter first program path: ')

if options.second is None:
	options.second = raw_input('Enter second program path: ')

print first, second 


