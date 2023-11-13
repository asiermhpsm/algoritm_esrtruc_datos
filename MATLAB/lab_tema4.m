clear;

%{
s = 1.839286755214161;
Iter=10;
x=zeros(1,Iter);
Erel=zeros(size(x));
x(1)=1.8;
Erel(1)=(abs(s-x(1)))/s;
for k=1:Iter
    x(k+1)=power(1+x(k)+x(k)^2, 1/3);
    Erel(k+1)=(abs(s-x(k+1)))/s;
    fprintf('Iter %2d: x = %.16f -> Erel = %.2e\n',k,x(k+1),Erel(k+1));
    fprintf('k=%.16f\n',Erel(k+1)/Erel(k));
end


x=zeros(1,Iter);
Erel=zeros(size(x));
x(1)=1.8;
Erel(1)=(abs(s-x(1)))/s;
for k=1:Iter
    x(k+1)=x(k)-((x(k)^3-x(k)^2-x(k)-1)/(3*x(k)^2-2*x(k)-1));
    Erel(k+1)=(abs(s-x(k+1)))/s;
    fprintf('Iter %2d: x = %.16f -> Erel = %.2e\n',k,x(k+1),Erel(k+1));
    fprintf('k=%.16f\n',Erel(k+1)/(Erel(k)^2));
end

%}

%{
xx=(0.05:0.05:0.5);
yy=prestamo(xx);
plot(xx,yy);
%}


iter=70;
x=zeros(1,iter);
x(1)=1;
x2=zeros(1,iter);
x2(1)=1;
for k=1:70
   x(k+1)=exp(-x(k));
   x2(k+1)=x2(k)-(x2(k)-exp(-x2(k)))/(exp(x2(k)));
end
Eabs=abs(x-x(iter));
Eabs2=abs(x2-x2(iter));
semilogy(Eabs,'bo');hold on;
semilogy(Eabs2,'ro');

for k=1:iter-1
   abs(Eabs(k+1))/(abs(e(k)))^2 
end
















