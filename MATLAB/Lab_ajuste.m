clear
%{
tk=[-1;0;1;2;4];
yk=[0;-2;0;3;3];
H1 = [tk.^0 tk.^1 tk.^2];
%c1=H1\yk;
Q1 = (H1'*H1);b1 = H1'*yk;
c1 = Q1\b1;
H2 = [tk.^0 cos(tk) sin(tk)];
%c2=H2\yk;
Q2 = (H2'*H2);b2 = H2'*yk;
c2 = Q2\b2;
r1=(yk-H1*c1);
r2=(yk-H2*c2);
E1=r1'*r1;
E2=r2'*r2;
x=(-1.5:0.1:4.5);
p1=c1(1)+c1(2)*x+c1(3)*x.^2;
p2=c2(1)+c2(2)*cos(x)+c2(3)*sin(x);
plot(tk,yk,'ko');hold on;
plot(x,p1,'b');
plot(x,p2,'r');hold off;
%}

%{
Temp=[25;100;150;300];
V=[0.7;0.06;0.02;0.0003];
v=log(V);
H=[Temp.^0 Temp];
c=H\v;
a=c(1); b=c(2);
A=exp(a);B=b;
T=(0:300);
p=A*exp(B*T);
plot(Temp, V, 'ro', T, p, 'b');
r1=V-(A*exp(B*Temp))
r2=v-H*c
%}

%{
tk =[0.5;1.0;1.5;2.0;2.5;3.0];
hk=[6.9;11.3;12.5;12.4;9.3;4.2];

H=[tk  -0.5*(tk.^2)];
b=hk;
c=H\b;
v0=c(1);
g=c(2);

r=b-H*c;
norma=norm(r);

t=(0:0.1:3.5);
p=v0*t+g*(-0.5)*(t.^2);
plot(tk,hk,'ro', t,p,'b');
%}

%{
tk =[0.5;1.0;1.5;2.0;2.5;3.0];
hk=[6.9;11.3;12.5;12.4;9.3;4.2];
g=9.8;
H=tk;
v=hk+0.5*g*(tk.^2);
c=H\v;
v0=c(1);

r=v-H*c;
norma=norm(r);

t=(0:0.1:3.5);
p=v0*t+g*(-0.5)*(t.^2);
plot(tk,hk,'ro', t,p,'b');
%}

%{
tk=[0;1;3;4;5];
yk=[0;1;2.5;0.5;0];
t=(-0.1:0.1:5.1);

tk2=tk(2:4,1);
yk2=yk(2:4,1);
H1=[tk2.^2-5*tk2 tk2.^3-25*tk2];
c=H1\yk2;
C=c(1);D=c(2);A=0;B=-5*C-25*D;
pp=A+B*t+C*(t.^2)+D*(t.^3);
plot(tk,yk,'ko', t,pp,'b');hold on;


H2=[tk.^0 tk.^1 tk.^2 tk.^3];
wk=[1;0.1;0.1;0.1;1];
W=diag(wk);
G=H2'*W*H2;
b=H2'*W*yk;
c2=G\b;
pp=c2(1)+c2(2)*t+c2(3)*(t.^2)+c2(4)*(t.^3);
plot(t,pp,'r');hold off;
%}

 %{
th_k=[3.12;3.00;2.89;2.79;2.51;1.99];
r_k=[19.25;12.84;9.38;6.97;3.77;1.77];
H=[th_k.^0 cos(th_k) sin(th_k)];
v=1./r_k;
c=H\v;
A=c(1);B=c(2);C=c(3);
L=1/A;
E=L*sqrt((B^2)+(C^2));
I=atan(C/B);
th=linspace(0,2*pi,1000);
r=1./(A+B*cos(th)+C*sin(th));
plot(r_k.*cos(th_k),r_k.*sin(th_k),'rs');hold on;
plot(r.*cos(th),r.*sin(th),'b');
plot(1*cos(th),1*sin(th),'k');

H2=H(1:3,:);
v2=v(1:3,:);
c2=H2\v2;
A2=c2(1);B2=c2(2);C2=c2(3);
L2=1/A2;
E2=L2*sqrt((B2^2)+(C2^2));
I2=atan(C2/B2);
r2=1./(A2+B2*cos(th)+C2*sin(th));
plot(r2.*cos(th),r2.*sin(th),'b');hold off;
%}


 
tk=[0.5;1.5;2.5;3.5;4.5]; 
yk=[0.70;1.25;0.78;0.24;0.06];

H=[tk.^0 tk.^2];
v=(log(yk)-log(tk));




















