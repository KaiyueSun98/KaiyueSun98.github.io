%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.1 statistical estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%1.1.1
close all
clear
clc
N=1000;
x=rand(N,1);
figure
h=plot(x);
s_m=mean(x);
xlabel 'n';
ylabel 'x[n]';
%title '1000 realisations of a uniform random process X~U(0,1)';
%%
%1.1.2
std=std(x);





    