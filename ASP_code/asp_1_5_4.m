%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.1 statistical estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.1.5
%repeat part 4
N=1000000;
x=randn(N,1);
%xbins=0.05:0.1:0.95;
%hist(x,xbins);
%figure;
%subplot(2,1,1),
nbins=100;
h=histogram(x,nbins);
h.Normalization='pdf';
%subplot(2,1,2),histogram(x,'Normalization','probability');
hold on
pd_n=makedist('Normal');
ax=-4:.1:4;
pdf_n=pdf(pd_n,ax);
plot(ax,pdf_n,'Linewidth',2);
legend('histogram','normal distribution')
xlabel 'x[n]';
ylabel 'probability distribution function';
title 'N=1000000,100 bins';
ylim([0 0.5]);