%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.3 estimation of probability distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.3.1
N=10000;
v=randn(1,N);
nbins=40;
h=histogram(v,nbins);
h.Normalization='pdf';
%subplot(2,1,2),histogram(x,'Normalization','probability');

% histfit(v);
% legend('samples','pdf');
 xlabel('v[n]');
 ylabel('PDF');

hold on
pd_n=makedist('Normal');
ax=-4:.1:4;
pdf_n=pdf(pd_n,ax);
plot(ax,pdf_n,'Linewidth',2);
legend('Distribution of v[n]','Gaussian distribution')
xlabel 'v[n]';
ylabel 'probability distribution function';