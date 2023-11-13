% h=10.^(0:-0.5:-15);
% x=1;
% ok = cos(x);
% est = (sin(x+h)-sin(x-h))./(2*h);
% Eabs = abs(est-ok);
% Erel = Eabs/abs(ok);
% figure(1); loglog(h,Erel,'bo-');
%
%
% cota_1 = h.^2/6;
% cota_2 = eps./h;
% cota=cota_1+cota_2;
% figure(2); loglog(h,Eabs,'bo-',h,cota,'r:')
%
% c=Eabs(1:5)./(h(1:5));
% fprintf('Relación suponiendo h  : '); fprintf('%.3f ',c); fprintf('\n');
% c=Eabs(1:5)./(h(1:5).^2);
% fprintf('Relación suponiendo h^2: '); fprintf('%.3f ',c); fprintf('\n');
% c=Eabs(1:5)./(h(1:5).^3);
% fprintf('Relación suponiendo h^3: '); fprintf('%.3f ',c); fprintf('\n');
%
% x=(0:0.01:2*pi); h=0.001;
% c = (sin(x+h)-sin(x-h))/(2*h);
% e = abs(c -cos(x));
% figure(3); plot(x,e)






S = paseo2D(10000);
figure(1); plot(S(1,:),S(2,:),'r')

x=S(1,:); y=S(2,:);
d = sqrt(x.^2 + y.^2);
figure(2); plot(d)



