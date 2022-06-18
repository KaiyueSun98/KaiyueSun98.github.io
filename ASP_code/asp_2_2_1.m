%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.1 ACF of uncorrelated and correlated sequences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.1.4
clear
close all
clc
N=1000;
x=randn(N,1);
y=filter(ones(9,1),[1],x);
[yacf,lag]=xcorr(y,'unbiased');
figure
stem(-20:20,yacf(980:1020));
grid on 
grid minor

xlabel('\tau')
ylabel('R_{xy}(\tau)')
%2.2.1
figure
[xyccf,lag]=xcorr(x,y,'unbiased');
stem(-20:20,xyccf(980:1020));
grid on 
grid minor
ylim([-1 2])
xlabel('\tau')
ylabel('R_{xy}(\tau)')
%2.1.4
y=filter(ones(5,1),[1],x);
[yacf,lag]=xcorr(y,'unbiased');
figure
stem(-20:20,yacf(980:1020));
grid on 
grid minor

xlabel('\tau')
ylabel('R_{xy}(\tau)')
%hacf=xcorr(xyccf,'unbiased');
%figure
%stem(-20:20,hacf(1979:2019));

%R(XY)=h(T)--->impulse response