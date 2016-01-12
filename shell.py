#!/bin/bash/env python

#Shell Commands within Python

import subprocess
#ls_output = subprocess.call('ls -l | wc -l', shell=True)
proc = subprocess.Popen(raw_input('Enter Your Command' ))
print proc
