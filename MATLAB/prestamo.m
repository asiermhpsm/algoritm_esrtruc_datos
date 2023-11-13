function p=prestamo(R)
    M=60;
    P=1540;
    N=36;
    r=R./12;
    p=M-(P.*r)./(1-(1+r).^-N);
end