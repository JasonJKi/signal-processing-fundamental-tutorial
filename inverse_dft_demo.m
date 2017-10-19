% dft demo
% generate a sinusoid

clear all
fs = 10;
t = (0:1/fs:5);
N = length(t);
x = sin(2*pi*t);
nFFT=100;

x = sin(2*pi*t);
X=mat_dft(x,nFFT);

figure(1)
subplot(2,1,1)
plot(real(ifft(fft(X,nFFT),N)))
subplot(2,1,2)
plot(real(mat_idft(X,N)))