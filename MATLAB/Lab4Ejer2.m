clc
N=15;
a=zeros(1,N);
b=zeros(1,N);
a(1)=2*sqrt(3);
b(1)=3;
for n=2:N
    a(1,n)=  2*a(1,n-1)*b(1,n-1) / (a(1,n-1)+b(1,n-1));
    b(1,n)= sqrt( a(1,n) * b(1,n-1) );
end

c=(a+b)./2;
ErrorRelativoA=abs(pi-a)./abs(pi);
ErrorRelativoB=abs(pi-b)./abs(pi);
ErrorRelativoC=abs(pi-c)./abs(pi);
semilogy (ErrorRelativoA,'ro:'); hold on;
semilogy (ErrorRelativoB,'bo:');
semilogy (ErrorRelativoC,'yo:');hold off;


