%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.1 statistical estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.1.5
%repeat part 3
N=1000;
for i=1:10
    x(:,i)=randn(N,1);
    s_m(i)=mean(x(:,i));
    s_std(i)=std(x(:,i));
end
m=0;
std=sqrt(1);
figure
plot(s_m,s_std,'*');
hold on
plot(m,std,'r*');
title 'estimator vs population mean and standard deviation';
xlabel 'sample mean';
ylabel 'sample standard deviation';
b_m=0-sum(s_m)/10;
b_s=1-sum(s_std)/10;