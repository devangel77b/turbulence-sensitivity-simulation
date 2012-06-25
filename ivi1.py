#!usr/bin/env python
'''
ivi1.py
(c) 2012 Dennis Evangelista
Testing stuff in Python
'''

import numpy
import matplotlib.pyplot as plt
import pylab

Fs = 625
t = numpy.arange(0.0,120.0,1.0/Fs)
du = 0.1
mu = 7
u = du*numpy.random.randn(t.shape[0])+mu

plt.psd(u,Fs=Fs,detrend=pylab.detrend_mean)
plt.semilogx()
plt.grid(True)
plt.show()
