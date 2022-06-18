%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.4 Cramer-Rao Lower Bound  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%2_4_1_(a)
clear
load NASDAQ.mat
x=NASDAQ.Close; 
x=x-mean(x);
%NASDAQ.Data
[a,e,r] = aryule(x,10);
stem(-r);
for p=1:10
[a1,e1(p)]=aryule(x,p);
MDL(p)=log(e1(p))+p*log(924)/924;
AIC(p)=log(e1(p))+2*p/924;
AICc(p)=AIC(p)+2*p*(p+1)/(923-p);
end
[as,es,rs] = aryule(x,10);
figure
stem(-rs)
grid minor
grid on
xlabel('\tau');
 ylabel('Correlation');



figure
plot(MDL)
grid minor
grid on
xlabel('Model Order');
 ylabel('Magnitude');
hold on
plot(AIC)
hold on
plot(AICc)
hold on
plot(log(e1))
legend('MDL','AIC','AICc','Loss function')
%%
%2_4_1_(b)
clear
close all
clc
load NASDAQ.mat
prices=NASDAQ.Close;
r_xx=xcorr(zscore(prices),'unbiased');
n=1:50:1001;
var=1:50:1001;

[N,VAR]=meshgrid(n,var);
crlb_var=2*(VAR.^2)./N;
crlb_a=(VAR)./(N*r_xx(924));

figure(1)
h=heatmap(n,var,crlb_var);
h.Colormap=parula;
h.ColorScaling='log';
title ('CRLB of noise variance')
xlabel('N')
ylabel('Variance')

figure(2)
h=heatmap(n,var,crlb_a);
h.Colormap=parula;
h.ColorScaling='log';
title ('CRLB of a[1]')
xlabel('N')
ylabel('a[1]')
%%






