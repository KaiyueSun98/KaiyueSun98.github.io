%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.1 statistical estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.1.4
N=1000000;
x=rand(N,1);
%xbins=0.05:0.1:0.95;
%hist(x,xbins);
%figure;
%subplot(2,1,1),
nbins=100;
h=histogram(x,nbins);

h.Normalization='pdf';

%histogram(x,'Normalization','probability');
%subplot(2,1,2),histogram(x,'Normalization','probability');
hold on
pd_u=makedist('Uniform');
ax=-.2:.01:1.4;
pdf_u=pdf(pd_u,ax);
stairs(ax,pdf_u,'Linewidth',2);
legend('distribution of x[n]','uniform distribution')
xlabel 'x[n]';
ylabel 'probability distribution function';
title 'N=1000000, 100 bins'
