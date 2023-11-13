%{
salto=0.1;
x=(-1:salto:1);
plot(x,fun2(x));
%}

%{
clear;
derivada=-0.392596787529302438;
x=1;
h=[0.1 0.01];
aprox=(fun(x+0.5.*h)-fun(x-0.5.*h))./h;
fprintf('derivada:%.7f\nh=0.1: %.7f\nh=0.01: %.7f\n',derivada,aprox(1,1),aprox(1,2));

% abs(aproximacion(1,1)-derivada)/abs(derivada)
% abs(aproximacion(1,2)-derivada)/abs(derivada)

N=15;
h=10.^-(1:N);
aprox=(fun(x+0.5.*h)-fun(x-0.5.*h))./h;
Eabs=abs(derivada-aprox);
loglog(h,Eabs);
%}




clear;

a=0;  b=2;
L=8;
I=zeros(3,L);
fprintf('k\t\t\tN\t\t\tFórmula 1\t\t\tFórmula 2\t\t\tFórmula 3\n');
for k=1:L
   N=2^k+1; 
   h=(b-a)/(N-1);
   x=linspace(a, b, N);
   f=fun2(x);
   I(1,k)=h*sum(f(1,1:N-1));
   I(2,k)=(h/2)*( f(1,1) + 2*sum(f(1,2:N-1)) + f(1,N) );
   I(3,k)=(h/3)*( f(1,1) + 4*sum(f(1,2:2:N-2)) + 2*sum(f(1,3:2:N-1)) + f(1,N) );
   fprintf('%d\t\t\t%3d\t\t\t%.12f\t\t%.12f\t\t%.12f\n',k,N,I(1,k),I(2,k),I(3,k));
end



res_ok=0.5635883513155333;
Erel1=abs(I(1,:)-res_ok)/abs(res_ok);
Erel2=abs(I(2,:)-res_ok)/abs(res_ok);
Erel3=abs(I(3,:)-res_ok)/abs(res_ok);
semilogy(1:L,Erel1,'b');hold on;
semilogy(1:L,Erel2,'r');
semilogy(1:L,Erel3,'y');hold off;









