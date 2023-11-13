function im2 = aplica_P(im,P)  
    im=double(im)/255;
    [N,M,NP]=size(im);
    X=zeros(N,M);Y=zeros(N,M);
    PP=[P;[0 0 1]];
    QQ=inv(PP);
    Q=QQ(1:2,:);
    for v=1:N
       for u=1:M
           uv=[u;v;1];
           res=Q*uv;
           X(v,u)=res(1,1);
           Y(v,u)=res(2,1);
       end
    end
    
    for k=1:NP
        im2(:,:,k)=interp2(im(:,:,k),X,Y,'bicubic');
    end
return