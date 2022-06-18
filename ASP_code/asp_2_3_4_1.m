%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.3 Autoregressive modelling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.3.4
load sunspot.dat
x=sunspot(:,2);
x=(x-mean(x))/std(x); %standardized
for p=1:10
[a,e(p)]=aryule(x,p);
MDL(p)=log(e(p))+p*log(288)/288;
AIC(p)=log(e(p))+2*p/288;
AICc(p)=AIC(p)+2*p*(p+1)/(287-p);
end

plot(MDL)
hold on
plot(AIC)
hold on
plot(AICc)
hold on
plot(log(e))
xlabel('model order');
ylabel('Magnitude');
grid minor
grid on
legend('MDL','AIC','AICc','Loss function')