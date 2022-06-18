%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.3 Autoregressive modelling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.3.1
N=10000;
a1=-2.5+(2.5+2.5)*rand(N,1);
a2=-1.5+(1.5+1.5)*rand(N,1);


w=randn(1000,1);
% for i=1:N
%  a=[a1(i),a2(i)];
%  a=[1,-a];
%  x=filter(1,a,w);
%   ax1=subplot(7,1,i);
%   plot(x)
%   ax2=subplot(7,1,6);
%   plot(ax2,a1(i),a2(i),'*')
%   hold(ax2,'on')
%   ax3=subplot(7,1,7);
%   if abs(x(1000))<1000
%       plot(ax3,a1(i),a2(i),'*')
%       hold(ax3,'on')
%   end
% end


for i=1:N
 a=[a1(i),a2(i)];
 a=[1,-a];
 x=filter(1,a,w);
 if abs(x(1000))<1000
     plot(a1(i),a2(i),'r*')
   
     hold on
 else plot(a1(i),a2(i),'b*')

      hold on
 end
end
xlabel('a1');
ylabel('a2');

