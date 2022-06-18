%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.3 estimation of probability distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.3.3
M=1;
clear 
close all
clc
M=100000;
N=1000;
  y1=rp1(M,N)./20;
  y1_ensemble=sum(y1,1)*1/M;
  x=1:N;
  y1_std=std(y1);
  figure
  plot(x,y1(1,:));
  xlabel 'n';
  ylabel 'signal amplitude';
  title 'non-stationary process';
  %%
  figure
  plot(x,y1_ensemble);
  xlabel 'n';
  ylabel 'ensemble mean';
  title 'non-stationary process';
nbins=100;
%%
figure
nnbins=20;
h=histogram(y1(1,:),nnbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'N=1000,20 bins';
 %%
 figure
h=histogram(y1(:,500),nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'n=500,N=1000000,100 bins';
 xlim([0.35 0.65])
 
figure
h=histogram(y1(:,250),nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'n=250,N=1000000,100 bins';
 xlim([0.1 0.4])
 figure
h=histogram(y1(:,500),nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'n=500,N=1000000,100 bins';
 xlim([0.35 0.65])
 figure
h=histogram(y1(:,900),nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'n=600,N=1000000,100 bins';
 xlim([0.75 1.05])
 figure
h=histogram(y1(:,1000),nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'n=1000,N=1000000,100 bins';
  xlim([0.85 1.15])