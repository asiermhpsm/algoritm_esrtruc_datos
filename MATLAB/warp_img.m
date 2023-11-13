function im2=warp_img(im,P,zona)
% im = imagen a deformar (im), P = familia de matrices afines a utilizar
% zona = información sobre el triángulo al que pertenece cada píxel.
im=double(im)/255;
[N,M,NP]=size(im);
X=zeros(N,M);Y=zeros(N,M);

Q=cell(1,length(P));
for k=1:length(P)
    PP=[P{k};[0 0 1]];
    QQ=inv(PP);
    Q{k}=QQ(1:2,:);
end

for v=1:N
    for u=1:M
        uv=[u;v;1];
        z=zona(v,u);
        res=Q{z}*uv;
        X(v,u)=res(1,1);
        Y(v,u)=res(2,1);
    end
end

for k=1:NP
    im2(:,:,k)=interp2(im(:,:,k),X,Y,'bicubic');
end

return