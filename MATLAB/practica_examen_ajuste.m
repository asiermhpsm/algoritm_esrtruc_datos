clear;

%Interpolacion u(x)
xk_interp=[-3;0;3];
yk_interp=[1.2;1.0;1.4];
H_interp=[xk_interp.^0 sin(xk_interp) cos(xk_interp)];
c_interp=H_interp\yk_interp;
A_interp=c_interp(1);
B_interp=c_interp(2);
C_interp=c_interp(3);
xx=(-pi:0.01:pi);
p_interp=A_interp+B_interp*sin(xx)+C_interp*cos(xx);
plot(xk_interp,yk_interp,'kx', xx,p_interp,'k');hold on;

%Ajuste u(x)
xk=[-3;-2;-1;0;1;2;3];
yk=[1.2;0.7;0.6;1.0;1.9;3.5;1.4];
H_ajuste=[xk.^0 sin(xk) cos(xk)];
c_ajuste=H_ajuste\yk;
A_ajuste=c_ajuste(1);
B_ajuste=c_ajuste(2);
C_ajuste=c_ajuste(3);
p_ajuste=A_ajuste+B_ajuste*sin(xx)+C_ajuste*cos(xx);
plot(xk, yk,'ro', xx,p_ajuste,'r');

%Errores u(x)
residuos_interp=yk-(A_interp+B_interp*sin(xk)+C_interp*cos(xk));
residuos_ajuste=yk-(A_ajuste+B_ajuste*sin(xk)+C_ajuste*cos(xk));
E_interp_min_cuad=norm(residuos_interp);
E_ajuste_min_cuad=norm(residuos_ajuste);
E_interp_abs=sum(abs(residuos_interp));
E_ajuste_abs=sum(abs(residuos_ajuste));

%Ajuste 1/u(x)
H_ajuste_inv=H_ajuste;
c_ajuste_inv=H_ajuste_inv\(1./yk);
A_ajuste_inv=c_ajuste_inv(1);
B_ajuste_inv=c_ajuste_inv(2);
C_ajuste_inv=c_ajuste_inv(3);
p_ajuste_inv=1./(A_ajuste_inv+B_ajuste_inv*sin(xx)+C_ajuste_inv*cos(xx));
plot(xx,p_ajuste_inv,'b');

%Errores 1/u(x)
residuos_ajuste_inv=yk-1./(A_ajuste_inv+B_ajuste_inv*sin(xk)+C_ajuste_inv*cos(xk));
E_ajuste_inv=norm(residuos_ajuste_inv);

%Ajuste 1/u(x); u(0)=1
wk=[0.1;0.1;0.1;1;0.1;0.1;0.1];
W=diag(wk);
H_pesos=H_ajuste_inv'*W*H_ajuste_inv;
b_pesos=H_ajuste_inv'*W*yk;
c_pesos=H_pesos\b_pesos;
p_ajuste_inv_pesos=1./(c_pesos(1)+c_pesos(2)*sin(xx)+c_pesos(3)*cos(xx));
plot(xx,p_ajuste_inv_pesos,'g');


















