function P=get_afin(x,y,u,v)
    v1=u;H1=[x y ones(3,1)];
    v2=v;H2=[x y ones(3,1)];
    c1=H1\v1;
    c2=H2\v2;
    P=[c1';c2'];
return
