#!/bin/bash/env python

#Shell Commands within Python

import subprocess
ls_output = subprocess.call('ls -l', shell=True)

print ls_output