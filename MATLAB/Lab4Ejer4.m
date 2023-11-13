clear
a =[3 7 15 1 292 1 1 1 2 1 3 1 14 2 1];
N=10;
x=zeros(1,N);
for n=1:N
    
   x(1,n)=x_from_fc(a(1,n));
end
ErrorAbsoluto=abs(x-pi);
ErrorRelativo=ErrorAbsoluto./abs(pi);
semilogy(ErrorRelativo,'bo:');

