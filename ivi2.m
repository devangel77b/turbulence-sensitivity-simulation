% integral scale
uscale = 0.1
lscale = 0.0762
nu = 15e-6;
Re = uscale*lscale/nu

% kolmogorov scale
eta = lscale*Re^(-0.75)
v = uscale*Re^(-0.25)

% define spectrum
oversampling = 10;
k = [0 logspace(log10(1/lscale/oversampling),log10(oversampling/eta))];
kh = k*lscale;
E = (kh.^4).*(1+kh.^2).^(-17/6).*exp(-kh*Re^(-0.75));
ks = oversampling/eta*2;

figure(1)
subplot(2,1,1)
loglog(k,E); 
xlabel('wavenumber, 1/m')
ylabel('E(k)')
grid on




% make white noise and filter to make turbulent pink noise
x = 0:(1/ks):10;
w = random('normal',0,1,size(x));
W = fft(w); z = linspace(0,1,length(W));
EE = [E E(2:(end-1))]; zz = [k 2*k(end)-k(2:(end-1))]/ks;
U = W.*interp1(zz,sqrt(EE),z);
u = ifft(U,'symmetric');

% plot resulting spectrum
welcher = spectrum.welch;
Wpsd = psd(welcher, w, 'Fs',ks)
Upsd = psd(welcher, u, 'Fs',ks)

figure(1)
subplot(2,1,2)
%loglog(Wpsd.Frequencies,Wpsd.Data,'g'); hold on
%loglog(Upsd.Frequencies,Upsd.Data); hold off
loglog(z,abs(W),'g'); hold on
loglog(z,abs(U).^2);
loglog(zz,abs(EE),'r'); hold off
%xlabel('wavenumber, 1/m');
%ylabel('PSD, ()/(1/m)');
grid on
%xlim([1 1e5])



