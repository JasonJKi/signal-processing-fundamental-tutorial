function X = mat_dft(x,K)
% Discrete Fourier Transform(DFT)
%   X = mat_dft(x,n);
%   matlab implementation of DFT
N = length(x);
if nargin < 2|| isempty(K); K=N;end;
if size(x,2)>size(x,1); x=x';end;
W = zeros(K,N);
for k=1:K
    for n = 1:N
        W(k,n)=exp(-1i*2*pi*(k-1)*(n-1)/K);
    end
end
X=W*x;