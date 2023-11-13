clear
%{
s=sqrt(5);
x(1)=2;

for n=1:9
   x(n+1)=(5+x(n))/(1+x(n));
end
for n=1:length(x)
   e(n)= abs(x(n)-s);
   fprintf('n=%2d->x=%.16f->e=%.2e\n',n,x(n),e(n));
end
semilogy(e,'b');hold on;

for n=1:9
   x(n+1)=(5+x(n))/(1+x(n));
   if(rem(n,2)==0)
       x(n+1)=x(n+1)-((x(n+1)-x(n))^2)/(x(n+1)-2*x(n)+x(n-1));
   end
end
for n=1:length(x)
   e(n)= abs(x(n)-s);
   fprintf('n=%2d->x=%.16f->e=%.2e\n',n,x(n),e(n));
end
semilogy(e,'r');
%}

c=6;
s=power(c,1/3);
x(1)=2;
e(1)=abs(s-x(1));
for n=1:15
    x(n+1)=sqrt(c/x(n));
    Eabs(n+1)=abs(s-x(n+1));
    fprintf('Iter %2d: x=%.15f->Eabs=%.2e\n',n,x(n+1),Eabs(n+1));
end

Erel=Eabs/abs(s);
cifras=-log10(Erel);
plot(cifras);

for n=1:length(x)-2
    abs(x(n+2)-x(n+1))/abs(x(n+1)-x(n))
end 



















