Fs = 625; Vave = 6; du = 0.1;
t = 0:(1/Fs):120;
v = Vave*ones(size(t))+random('norm',0,du,size(t));
u = random('norm',0,du,size(t));
uu = u-mean(u);

h = spectrum.welch;
Hpsd = psd(h,uu,'Fs',Fs);


% scales

% large scale
uT = du;  % get this from measurements
lT = 0.1; % size of generating object
tT = lT/uT;


nu = 15e-6; % kinematic viscosity, m2/s
rate_of_dissipation = uT^2/(lT/uT);  % scaling from UW notes
kolmogorov_length_scale = (nu^3/rate_of_dissipation)^(1/4);
kolmogorov_time_scale = (nu/rate_of_dissipation)^(1/2);
kolmogorov_velocity_scale = (nu*rate_of_dissipation)^(1/4);
