function x = mat_idft(X,N)
% Inverse Discrete Fourier Transform(IDFT)
%       x = mat_idft(X,n);
%       matlab implementation of DFT
K = length(X);
if nargin < 2|| isempty(N); N=K;end;
if size(X,2)>size(X,1); x=x';end;
W = zeros(N,K);
for n=1:N
    for k = 1:K
        W(n,k)=exp(1i*2*pi*(k-1)*(n-1)/K);
    end
end
x=(W*X)/N;
end

