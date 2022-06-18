%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.2 stochastic processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.2.1
clear
close all
clc
M=100;
N=100;
  y1=rp1(M,N);
  y1_ensemble=sum(y1,1)*1/M;
  x=1:N;
  y1_std=std(y1);
  figure
  subplot(2,1,1),
  plot(x,y1_ensemble);
  xlabel 'n';
  ylabel 'ensemble mean';
  subplot(2,1,2),
  plot(x,y1_std);
  xlabel 'n';
  ylabel 'ensemble standard deviation';
 y2=rp2(M,N);
 y2_ensemble=sum(y2,1)*1/M;
 y2_std=std(y2);
 figure
 subplot(2,1,1),
 plot(x,y2_ensemble);
  xlabel 'n';
  ylabel 'ensemble mean';
 subplot(2,1,2),
 plot(x,y2_std);
  xlabel 'n';
  ylabel 'ensemble standard deviation';
 
 y3=rp3(M,N);
 y3_ensemble=sum(y3,1)*1/M;
 y3_std=std(y3);
 figure
 subplot(2,1,1),
 plot(x,y3_ensemble);
 xlabel 'n';
  ylabel 'ensemble mean';
 subplot(2,1,2),
 plot(x,y3_std);
 xlabel 'n';
  ylabel 'ensemble standard deviation';



