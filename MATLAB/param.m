function [x,y]=param(t)
   x = cos(4*pi*t)./(1+5*t.^2);  
   y = sin(4*pi*t)./(1+5*t.^2); 
return
