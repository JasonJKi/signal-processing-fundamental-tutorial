function y = mat_conv(x,h)
% Convolution
%       y = mat_conv(x,h)
%       matlab implementation of convolution 
N=length(x);
t=length(h);
y=zeros(N,1);
for n=1:N
    h_m=0;
    for m=1:t
        if (n-m) > 0
            h_m=h_m+x(n-m)*h(m);
        end
    end
    y(n)=h_m;
end