clear

tk=(-3:3)';
yk=mi_sinc(tk);


H_pol=[tk.^0 tk.^1 tk.^2 tk.^3 tk.^4 tk.^5 tk.^6];
H_trig=[tk.^0 sin(tk) cos(tk) sin(2*tk) cos(2*tk) sin(3*tk) cos(3*tk)];
c_pol=H_pol\yk;
c_trig=H_trig\yk;
p_pol=c_pol(1)*tk.^0+c_pol(2)*tk.^1+c_pol(3)*tk.^2+c_pol(4)*tk.^3+c_pol(5)*tk.^4+c_pol(6)*tk.^5+c_pol(7)*tk.^6;
p_trig=c_trig(1)*tk.^0+c_trig(2)*sin(tk)+c_trig(3)*cos(tk)+c_trig(4)*sin(2*tk)+c_trig(5)*cos(2*tk)+c_trig(6)*sin(3*tk)+c_trig(7)*cos(3*tk);



xx=(-3:3);
figure(1);plot(xx,mi_sinc(xx),'k');hold on;
plot(tk,yk,'ko');
plot(xx,p_pol,'b');
plot(xx,p_trig,'r');hold off;

e_pol=mi_sinc(xx)-(c_pol(1)*xx.^0+c_pol(2)*xx.^1+c_pol(3)*xx.^2+c_pol(4)*xx.^3+c_pol(5)*xx.^4+c_pol(6)*xx.^5+c_pol(7)*xx.^6);
e_trig=mi_sinc(xx)-(c_trig(1)*xx.^0+c_trig(2)*sin(xx)+c_trig(3)*cos(xx)+c_trig(4)*sin(2*xx)+c_trig(5)*cos(2*xx)+c_trig(6)*sin(3*xx)+c_trig(7)*cos(3*xx));
figure(2);plot(xx,e_pol,'b', xx,e_trig,'r');




















