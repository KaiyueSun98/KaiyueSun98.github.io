%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.1 statistical estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.1.3
clear 
close all
clc
N=1000;
for i=1:10
    x(:,i)=rand(N,1);
    s_m(i)=mean(x(:,i));
    s_std(i)=std(x(:,i));
end
m=0.5;
std=sqrt(1/12);
figure
plot(s_m,s_std,'*');
hold on
plot(m,std,'r*');
legend('sample values','theoretical value')
%title 'estimator vs population mean and standard deviation';
xlabel 'mean';
ylabel 'standard deviation'
b_m=0.5-sum(s_m)/10;
per_error_m=b_m/m;
b_s=sqrt(1/12)-sum(s_std)/10;
per_error_std=b_s/std;