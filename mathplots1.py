#/usr/bin/env python
'''
mathplots1.py
(c) 2012 Dennis Evangelista
Make plots for illustrating turbulence sensitivity concepts.
'''

import matplotlib.pyplot as plt
import numpy



# some definitions
du = 0.1 # velocity fluctuation size
l = 0.1  # velocity fluctuation integral scale
nu = 15.0e-6 # m2/s, air
Re = du*l/nu # for turbulent eddies


def E(k):
    kh = k*l
    return kh**4.0*(1.0+kh**2.0)**(-17.0/6.0)*numpy.exp(-kh*Re**(-0.75))

#k = numpy.linspace(10.0,1.0/0.0001,100)
k = numpy.logspace(0,4,100)

fig = plt.figure()
ax = fig.add_subplot(111)
ax.loglog(k,E(k))
ax.grid(True)
ax.set_xlabel(r"$k$")
ax.set_ylabel(r"$E(k)$")
plt.show()
