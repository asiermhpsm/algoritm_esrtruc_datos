function s=newton(fun,x0,tol)
% fun puntero a función que devuelve f(x) y f'(x), x0  punto inicial
for iter=1:10,
    [f fp]=fun(x0); % Llamo a f para obtener valores de f(x) y f'(x)
    if f==0, break; end  % He tenido suerte (me salgo)
    if abs(f)<=tol, break;end
    x1 =x0-(f/fp);      % Iteracion de Newton.
    fprintf('%2d -> %18.15f\n',iter,x1);  % Vuelco datos iteracion.
    x0=x1;     % Actualizo x0 con el ultimo valor x1 para volver a iterar.
end
s = x1;  % Al final devuelvo último término de la sucesión.
end

