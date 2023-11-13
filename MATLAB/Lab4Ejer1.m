h=10.^(0:-0.5:-15); 
x=1; 
res=(sin(x+h)-sin(x-h))./(2*h); 
ErrorAbsoluto=abs(res-cos(x)); 
ErrorRelativo=ErrorAbsoluto/abs(cos(x));  
cota=((h.^2)./6)+((eps(1))./h);
loglog(h,ErrorAbsoluto,'bo-',h, cota, 'r:');