%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.3 Autoregressive modelling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.3.2
clear
load sunspot.dat
x=sunspot(:,2);
%x=x/std(x);
xc=x-mean(x);
%xc=xc/std(x);

  for N=[5,20,250]
 xacf=xcorr(x(1:N),'unbiased');
 xcacf=xcorr(xc(1:N),'unbiased');
 ax= linspace(-N+1, N-1, 2*N-1);
 figure
 stem(ax,xacf)
 hold on 
 stem(ax,xcacf)
 grid minor
 grid on
 xlabel('\tau');  
 xlim([0 N]);
 ylabel('R_X(\tau)');
 legend ('raw data','zero-mean');
 end
%N从大到小，peak从大到小， N=250:oscillation, N=20:3 peaks, N=5,1 peak

%xc=x-mean(x);

% for N=[5,20,250]
% %xacf=xcorr(x(1:N),'unbiased');
% xcacf=xcorr(xc(1:N));
%  figure
%  plot(xcacf)
%  end
%N=5,perfect triangle, N=20 2small peaks smoothed out
%N=250 triangle removed, only peak and oscillation
%[PartialACF,lags,bounds]=parcorr(x,'NumLags',10);
%parcorr(x,'NumLags',40)
%%
%2.3.3
xs=xc/std(x);
 [a,e,r] = aryule(x,10);
 figure
 
 stem(-r)%model order 2;
 grid minor
 grid on
 xlabel('\tau');
 ylabel('correlation');
 hold on
 [as,es,rs] = aryule(xs,10);
 [ac,ec,rc] = aryule(xc,10);
 stem(-rc)
 stem(-rs)
  legend('raw data','centered','standardised')
% 
%centered data has same partial correlation functions as standardized data
%it's the mean causing diffenrent a


