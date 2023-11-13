function s=secante(f,x0,x1,tol)
f0=f(x0); f1=f(x1);x2=0;
iter=1;
while(iter<=10  &&  abs(f1-f0)>=tol)
    fp1=(f1-f0)/(x1-x0);
    x2=x1-(f1/fp1);
    fprintf('%2d -> %18.15f\n',iter,x2);  
    x0=x1;x1=x2;
    f0=f1;f1=f(x2);
    iter=iter+1;
end
s = x2;
end

