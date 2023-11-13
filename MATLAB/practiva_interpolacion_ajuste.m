clear

%{
x=[200 400 600]';
y=[375 125 375]';
u=[ 87 319 600]';
v=[445  69 375]';
P=get_afin(x,y,u,v);
Q=get_afin(u,v,x,y);


PP=[P;[0 0 1]];
QQ=inv(PP);
%}

%{
P =[ 0.8  -0.9 200;
    -0.2   1.0  20];
im=imread('ant.jpg');
im2 = aplica_P(im,P);
imshow(im2);
%}


%{
load new_puntos;
willis=imread('willis.jpg');
ant=imread('ant.jpg');

figure(1);imshow(willis);hold on;
plot(x1,y1,'r+','MarkerSize',6,'LineWidth',2);hold off;
figure(2);imshow(ant);hold on;
plot(x2,y2,'r+','MarkerSize',6,'LineWidth',2);hold off;

t=0.7;
u=(1-t)*x1+t*x2;
v=(1-t)*y1+t*y2;
T=delaunay(u,v);


figure(3);imshow(willis);hold on;
plot(x1,y1,'r+','MarkerSize',6,'LineWidth',2);
triplot(T,x1,y1);hold off;
figure(4);imshow(ant);hold on;
plot(x2,y2,'r+','MarkerSize',6,'LineWidth',2);
triplot(T,x2,y2);hold off;

NT=length(T);

P1=cell(1,NT);
for k=1:NT
    triangulo=T(k,:);
    X=x1(triangulo,:);Y=y1(triangulo,:);
    U=u(triangulo,:);V=v(triangulo,:);
    P1{k}=get_afin(X,Y,U,V);
end

P2=cell(1,NT);
for k=1:NT
    triangulo=T(k,:);
    X=x2(triangulo,:);Y=y2(triangulo,:);
    U=u(triangulo,:);V=v(triangulo,:);
    P2{k}=get_afin(X,Y,U,V);
end

figure(5);
[N1,M1,NP1]=size(willis);
zona1=determina_triang(T,u,v,N1,M1);
willisMedio=warp_img(willis,P1,zona1);
imshow(willisMedio);


figure(6);
[N2,M2,NP2]=size(ant);
zona2=determina_triang(T,u,v,N2,M2);
antMedio=warp_img(ant,P2,zona2);
imshow(antMedio);



mezcla=(1-t)*willisMedio + t*antMedio;
figure(7);
imshow(mezcla);


N=15; x=(-N:N)/N; t=0.5+tan(x)/pi; t=[t fliplr(t)];
for i=1:length(t)
    coef=t(:,i);
    u=(1-coef)*x1+coef*x2;
    v=(1-coef)*y1+coef*y2;
    T=delaunay(u,v);
    
    NT=length(T);
    
    P1=cell(1,NT);
    for k=1:NT
        triangulo=T(k,:);
        X=x1(triangulo,:);Y=y1(triangulo,:);
        U=u(triangulo,:);V=v(triangulo,:);
        P1{k}=get_afin(X,Y,U,V);
    end
    
    P2=cell(1,NT);
    for k=1:NT
        triangulo=T(k,:);
        X=x2(triangulo,:);Y=y2(triangulo,:);
        U=u(triangulo,:);V=v(triangulo,:);
        P2{k}=get_afin(X,Y,U,V);
    end
    
    [N1,M1,NP1]=size(willis);
    zona1=determina_triang(T,u,v,N1,M1);
    willisMedio=warp_img(willis,P1,zona1);
    
    [N2,M2,NP2]=size(ant);
    zona2=determina_triang(T,u,v,N2,M2);
    antMedio=warp_img(ant,P2,zona2);
    
    mezcla=(1-coef)*willisMedio + coef*antMedio;
    fich=sprintf('morph%02d.jpg',i);
    imwrite(mezcla,fich,'Quality',95);
end
%}

load puntos_control;
mapa=imread('mapa.jpg');
figure(1);
imshow(mapa);hold on;
plot(X,Y,'r+');hold off;


X(4,:)=[];
Y(4,:)=[];
E(4,:)=[];
N(4,:)=[];
[P,res]=get_similar(X,Y,E,N);
fprintf('%6.3f %6.3f %9.1f\n',P');
figure(2);
plot((1:length(res)/2),res(1:length(res)/2));


PP=[P;[0 0 1]];
QQ=inv(PP);
Q1=QQ(1:2, :);
Q2=get_similar(E,N,X,Y);

diferencia=Q2-Q1;

load track;
pixels=zeros(size(track));
for k=1:length(track)
    pixels(:,k)=Q1*[track(:,k);1];
end
figure(3);
imshow(mapa);hold on;
plot(pixels(1,:),pixels(2,:), 'b','LineWidth',2);holf off;









