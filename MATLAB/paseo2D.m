function S=paseo2D(N)
S=zeros(2,N);
for k=2:N
    angulo=2*pi*rand(1,1);
    x=[cos(angulo) ; sin(angulo)];
    S(:,k)=S(:,k-1)+x;
end
return
