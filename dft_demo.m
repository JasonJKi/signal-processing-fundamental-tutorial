% dft demo
% generate a sinusoid
clear all
fs = 10;
t = (0:1/fs:5);
N = length(t);
x = sin(2*pi*t);

nFFT=100; % number of frequency bins

for k=1:nFFT;
    X_k=0;
    for n = 1:N
        X_k = X_k + x(n)*exp(-j*2*pi*(k-1)*(n-1)/nFFT);
    end
    X(k)=X_k;
end

X_fft= fft(x,nFFT);
f = (0:N/2-1)*fs/N;
figure(1)
subplot 211;
plot(abs(X))
subplot 212;
plot(abs(X_fft))