N = 6
C = [0 0 0 0 0 0
    1 0 0 1 0 1
    0 0 0 0 1 1
    1 1 1 0 0 1
    0 0 1 1 0 0
    0 1 0 1 0 0]
Nj=sum(C)
dj= zeros(size(Nj));
for i=1:N
    if Nj(i)== 0
       dj(i)=1; 
    end
end
dj
A=C./Nj

e=ones(N,1)
S = A + 1/N * e * dj

[V, D] = eig(S);
Vabs=abs(V)
Dabs=abs(D)
col=1;
t=D(col,col);
for i=2:size(Dabs(1,:))
   if Dabs(i,i)> t
      t=Dabs(i,i); 
      col=i;
   end
end
t
v=Vabs(:,col)

x=[1 0 0 0 0 0]';
for k=1:100
    x=x/norm(x);
    x=A*x;
end
lamda=norm(x)
error=norm(x-S*x)

alfa=0.85
G=alfa*S+(1-alfa) * 1/N * ones(N)



