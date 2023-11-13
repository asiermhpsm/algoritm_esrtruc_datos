function f=mi_sinc(x)
f=sin(pi*x)./(pi.*x);
f(isnan(f))=1;
end