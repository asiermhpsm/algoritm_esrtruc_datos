function [P,res]=get_similar(X,Y,E,N)
    H=[X Y ones(size(X)) zeros(size(X));
        -Y X zeros(size(X)) ones(size(X))];
    v=[E;N];
    c=H\v;
    P=[c(1,1) c(2,1) c(3,1);
        c(2,1) -c(1,1) c(4,1)];
    res=v-H*c;
end