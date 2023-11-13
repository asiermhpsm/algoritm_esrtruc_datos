function [F,J]= fun_pix(X)
global ctrl_3D ctrl_PX ctrl_PY
 
% X = vector columna 6x1 con la posicion/orientación cámara
% F = vector columna con los residuos en puntos de control
 
% Calculo de F (vector de residuos)
 [px,py]= mod_cam(ctrl_3D,X);
 resx = (ctrl_PX-px);
 resy = (ctrl_PY-py);
 F = [resx resy]';
if nargout==1, return; end
% Aproximacion a la matriz J
    
    J = zeros(length(F),length(X));
    h = 0.1;
  for k=1:length(X)
      H = zeros(size(X));
      H(k) = h;
      J(:,k) = (fun_pix(X+H)-F)/h;
  end
 
return