close all
clear all
fs=50;
t=0:1/fs:1-1/fs;
f=5;
x=sin(2*pi*f*t');
h=[0 2 3 5 3 1 0]';

y=mat_conv(x,h);
Y=mat_dft(x).*mat_dft(h,length(t));

figure(1)
subplot 411
plot(y)
subplot 412
plot(conv(x,h))
subplot 413
plot(real(mat_idft(Y)))