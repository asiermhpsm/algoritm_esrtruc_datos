function x=x_from_fc(a)
L=length(a);
x=a(1,L);
for k=L-1:-1:1
    x=a(k)+1/x;
end
return