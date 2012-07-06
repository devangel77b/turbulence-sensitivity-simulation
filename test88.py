#!/usr/bin/env python

import numpy
import matplotlib.pyplot as plt

dx = 0.001
x = numpy.arange(0.0,10.0,dx)
Nx = x.shape[0]
ks = 1.0/dx

NFFT = 32768
k = numpy.linspace(0.0,ks/2.0,NFFT/2+1)
magU = 1.0/numpy.sqrt(k)
magU[0] = 0
fazU = numpy.random.random(k.shape)*numpy.pi
fftU = magU*numpy.exp(numpy.complex(0,1)*fazU)
u = numpy.fft.irfft(fftU,NFFT)*(NFFT)**0.5

# Check Parseval's theorem to see what scaling factor should be??? 
# Parseval says it should be 1???!
# But that gives super tiny u's.

UU, freqs = plt.psd(u,NFFT=1024,noverlap=256,Fs=ks)
plt.close()


plt.plot(k,magU**2)
plt.plot(freqs,UU*ks/(2**0.5)) # and wtf - why do i need to multiply by ks
plt.loglog()
plt.grid(True)
plt.show()

# OK I think this is at least the right normalization.
# damn fft
