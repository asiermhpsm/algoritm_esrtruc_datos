clear;

c=10;s=log(c);
x_ini=2;iter=4;

%EJERCICIO 1
x1=zeros(iter+1,1);x1(1)=x_ini;
e1=zeros(size(x1));e1(1)=abs(s-x1(1));
for n=1:iter
    x1(n+1)=x1(n)+(c-exp(x1(n)))/(4*x1(n));
    e1(n+1)=abs(s-x1(n+1));
end
fprintf('Metodo 1:\n');
for n=1:length(x1)
    fprintf('%2d) x=%.16f -> e=%.4e\n',n,x1(n),e1(n));
end
semilogy(e1,'b');hold on;
K1=mean(e1(2:end)./e1(1:end-1));
v1=log10(1/K1);


%EJERCICIO 2
x2=zeros(iter+1,1);x2(1)=x_ini;
e2=zeros(size(x2));e2(1)=abs(s-x2(1));
for n=1:iter
    x2(n+1)=x2(n)-(exp(x2(n))-c)/(exp(x2(n)));
    e2(n+1)=abs(s-x2(n+1));
end
fprintf('Metodo 2:\n');
for n=1:length(x1)
    fprintf('%2d) x=%.16f -> e=%.4e\n',n,x2(n),e2(n));
end
semilogy(e2,'r');


%EJERCICIO 3
x3=zeros(iter+1,1);x3(1)=x_ini;
e3=zeros(size(x2));e3(1)=abs(s-x2(1));
for n=1:iter
    x3(n+1)=x3(n)+2*(c-exp(x3(n)))/(c+exp(x3(n)));
    e3(n+1)=abs(s-x3(n+1));
end
fprintf('Metodo 3:\n');
for n=1:length(x1)
    fprintf('%2d) x=%.16f -> e=%.4e\n',n,x3(n),e3(n));
end
semilogy(e3,'g');hold off;


%FINAL
xx=(0:0.01:5);
tol=10e-5;
iter=zeros(size(xx));
for k=1:length(xx)
    x0=xx(n);
    n=1;
    e=abs(s-x);
    while(e>tol)
        x=c*exp(-x0)+x0-1;
        n=n+1;
        e=abs(s-x);
    end
    iter(k)=n;
end
figure;plot(xx,iter);












