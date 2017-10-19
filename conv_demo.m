% simplest way of writing the convolution function
clear all
x=[1 2 3 4 3 2 1];
f=[0 0 0 2 0 0 0]

T=length(x)
t=length(f) 
for n=1:T
    k=0;
    for m=1:t
        if (n-m) > 0
            m
            k=k+f(m)*x(n-m);
        end
    end
    h(n)=k;
end
figure(1)
plot(h)