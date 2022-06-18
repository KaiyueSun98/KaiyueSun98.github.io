%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.3 Autoregressive modelling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.3.5
close all
 clear
 load sunspot.dat
 x=sunspot(:,2);
 x=(x-mean(x))/std(x);
 order=[1,2,10];
 h=[1,2,5,10];%prediction horizon

%i=3;%order
j=4;%prediction horizon
idpoly1=ar(x,order(1),'yw');
idpoly2=ar(x,order(2),'yw');
idpoly10=ar(x,order(3),'yw');
p1=predict(idpoly1,x,h(j));
p2=predict(idpoly2,x,h(j));
p10=predict(idpoly10,x,h(j));
%pp=zeros(288,1);
%pp(1:(end-j))=p((j+1):end);
%pp((end-j):end)=0;

 figure
 grid minor
grid on
 xlabel('Time');
 ylabel('Magnitude');
 ylim([-1.5 4]);
 hold on
plot(x);
plot(p1);
hold off
legend('raw data','AR(1)');

figure
grid minor
grid on
 xlabel('Time');
 ylabel('Magnitude');
 ylim([-1.5 4]);
hold on
plot(x);
plot(p2);
hold off
legend('raw data','AR(2)');

figure
grid minor
grid on
 xlabel('Time');
 ylabel('Magnitude');
 ylim([-1.5 4]);
hold on
plot(x);
plot(p10);
hold off
legend('raw data','AR(10)')
%=aryule(x,4);
%arr=aryule(p,4);
%arrr=aryule(pp,4);
%the predictioin is not using the coefficient a of AR(p)
%prediction is n(prediction horizon)time intervals leading the actual data
%whether alignment is needed?