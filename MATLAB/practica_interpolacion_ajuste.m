clear

x=[200 400 600]';
y=[375 125 375]';
u=[ 87 319 600]';
v=[445  69 375]';
P=get_afin(x,y,u,v);
Q=get_afin(u,v,x,y);


PP=[P;[0 0 1]];
QQ=inv(PP);
