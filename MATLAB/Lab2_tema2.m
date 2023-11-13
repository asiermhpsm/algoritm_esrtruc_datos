
clear
%{
%EJERCICIO 1
xx=(-1:0.1:1);
ff=fun(xx);
N=5;
xk=linspace(-1,1,N);
yk=fun(xk);
pp=newton(xk,yk,xx);
figure(1);plot(xx,ff,'b');hold on;
plot(xk,yk,'bo');
plot(xx,pp,'r');hold off;
fprintf('Máxima diferencia: %.2e.\n',max(abs(ff-pp)));
%}

%{
%EJERCICIO 2
xk = (200:207)';
yk = rand(8,1);
xx=(200:0.001:207);
H=zeros(length(xk),length(yk));
for k=0:7
    H(:,k+1)=xk.^k;
end
v=yk;
c=H\v;
pp1=polyval(flip(c),xx);

pp2=newton(xk,yk,xx);
figure(2);plot(xx,pp1,'g');hold on;
plot(xx,pp2,'b');
plot(xk,yk,'ko');hold off;

c
dd=newton(xk,yk)
%}

%{
%EJERCICIO 3a
t=(0:0.001:1);
[x,y]=param(t);
figure(3);plot(x,y);

N=15;
tk=linspace(0,1,N);
[xk,yk]=param(tk);
px=newton(tk,xk,t);
py=newton(tk,yk,t);
figure(4);plot(x,y,'b');hold on;
plot(xk,yk,'bo');
plot(px,py,'r');hold off;
%}


%{
%EJERCICIO 3b
load mano;
t=(0:0.001:1);
tk=linspace(0,1,length(xk));
%{
px=newton(tk,xk,t);
py=newton(tk,yk,t);
figure(5);plot(xk,yk,'ro');hold on;
plot(px,py,'r');hold off;
%}
px=spline(tk,xk,t);
py=spline(tk,yk,t);
figure(5);plot(xk,yk,'ro');hold on;
plot(px,py,'r');hold off;
%}

%EJERICIO 5
[v,fs]=audioread('voz.wav');
t=(0:length(v)-1)/fs*1000;
plot(t,v);
N=length(v);
w=zeros(1,2*N-1);
w(1:2:end)=v(1:end);
w(2:2:end-1)=(w(1:2:end-1)+w(3:2:end))/2;
sound(w,16000);



















