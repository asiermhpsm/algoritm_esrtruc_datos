 clear

tk=[0.0	0.5	1.0	1.5	2.0	2.5	3.0]';
yk=[4.46 1.94 1.34 0.92	0.76 0.60 0.55]';


H1=[tk.^0 tk.^1 tk.^2 tk.^3 tk.^4];
c1=H1\yk;
res1=yk-(c1(1)*tk.^0+c1(2)*tk.^1+c1(3)*tk.^2+c1(4)*tk.^3+c1(5)*tk.^4);
norm1=norm(res1);

H2=[tk.^0 tk.^1];
c2=H2\(1./yk);
res2=yk-(1./(c2(1)+c2(2)*tk));
norm2=norm(res2);

t=(0:0.1:3);
p1=c1(1)*t.^0+c1(2)*t.^1+c1(3)*t.^2+c1(4)*t.^3+c1(5)*t.^4;
p2=1./(c2(1)+c2(2)*t);
plot(tk,yk,'rs');hold on;
plot(t,p1,'r');
plot(t,p2,'b');

sum(abs(res1));
sum(abs(res2));

c1(1)+c1(2)*4+c1(3)*4^2+c1(4)*4^3+c1(5)*4^4;
1/(c2(1)+c2(2)*4);


tk2=[0.5 1.0 1.5 2.0 2.5 3.0]';
yk2=[1.94 1.34 0.92	0.76 0.60 0.55]';

H3=(tk2.^0);
v=((1./yk2)-(1/4.46));
c3=H3\v;
res3=yk-(1./((1/4.46)+c3()*tk));
norm3=norm(res3)
p3=1./((1/4.46)+c3()*t);
plot(t,p3,'g');

















