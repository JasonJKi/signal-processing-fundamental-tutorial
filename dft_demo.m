% dft demo
% generate a sinusoid
clear all
close all
fs = 100;
t = (0:1/fs:10-1/fs);
N = length(t);
x = sin(2*pi*t)';

nFFT=fs; % number of frequency bins
X_fft= fft(x,fs);
figure(1)
subplot 211;
plot(abs(X_fft))
subplot 212;
plot(abs(mat_dft(x,fs)))

N=20

for i = 1:fs
    compass(X_fft(i))
    pause
end

