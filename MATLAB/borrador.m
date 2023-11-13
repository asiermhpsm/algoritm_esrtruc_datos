clear;global ctrl_3D ctrl_PX ctrl_PY
load datos;
ctrl_PX(1)=1042;
ctrl_PY(1)=726;
im=imread('gredos.jpg'); figure(1); image(im);
hold on
plot(ctrl_PX,ctrl_PY,'ro')
hold off
E0 = sum(ctrl_3D(1,:))/4+2000;
N0 = sum(ctrl_3D(2,:))/4;
H0 = sum(ctrl_3D(3,:))/4 -500;
A0 = -90;
X0 = [E0,N0,H0,A0,0,0]'
X = X0;
dX = 1;
n = 0;
% Bucle hasta cumplir condiciones de parada
    while(norm(dX)>=0.1 && n<200)
    % Evaluar funcion F y jacobiano J     
     [F,J]= fun_pix(X);  
    % Hallar dX y actualizar X        
    dX = J\(-F);
    X = X + dX;
    fprintf('iter %.0f norma de F = %.2f\n',n+1,norm(F));
    % Incrementad contador de iteracion
     n = n + 1;
% End del bucle 
    end
    fprintf('%.1f\n',X)