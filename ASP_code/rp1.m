function v=rp1(M,N); 
    a=0.02;
    b=5;
    Mc=ones(M,1)*b*sin((1:N)*pi/N);
    Ac=a*ones(M,1)*[1:N];
    v=(rand(M,N)-0.5).*Mc+Ac;
end
    
% function v=rp2(M,N);
%     Ar=rand(M,1)*ones(1,N); 
%     Mr=rand(M,1)*ones(1,N); 
%     v=(rand(M,N)-0.5).*Mr+Ar;
% end
% function v=rp3(M,N);
%     a=0.5;
%     m=3;
%     v=(rand(M,N)-0.5)*m + a;
% end

% M=100;
% N=100;
% y1=rp1(M,N);
% y1_ensemble=sum(y1,1)*1/M;
