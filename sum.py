#!/bin/bash/env python

# Starters

import sys
import time
import optparse

print 'Hello, this will be a normal script to add two numbers either passed as arguements or requested from you during run time'

#time.sleep(1)

if len(sys.argv) > 1 :

   a = int(sys.argv[1])
   b = int(sys.argv[2])



else :


   a = int(raw_input(' Enter Number 1 '))
   b = int(raw_input(' Enter Number 2 '))

c = a + b

print ' The sum is ',c



