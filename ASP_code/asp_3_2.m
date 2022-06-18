%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Random signals and stochastic processes
%1.3 estimation of probability distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.3.2
M=1;
N=100
y3=rp3(M,N);
nbins=100;
figure
h=histogram(y3,nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'N=100,100 bins';
pd_u=makedist('Uniform','lower',-1,'upper',2);
ax=-1.2:.01:2.2;
pdf_u=pdf(pd_u,ax);
hold on
plot(ax,pdf_u,'r','Linewidth',2);

M=1;
N=1000
y3=rp3(M,N);
nbins=100;
figure
h=histogram(y3,nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'N=1000,100 bins';
pd_u=makedist('Uniform','lower',-1,'upper',2);
ax=-1.2:.01:2.2;
pdf_u=pdf(pd_u,ax);
hold on
plot(ax,pdf_u,'r','Linewidth',2);

M=1;
N=10000
y3=rp3(M,N);
nbins=100;
figure
h=histogram(y3,nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'N=10000,100 bins';
pd_u=makedist('Uniform','lower',-1,'upper',2);
ax=-1.2:.01:2.2;
pdf_u=pdf(pd_u,ax);
hold on
plot(ax,pdf_u,'r','Linewidth',2);

M=1;
N=100000
y3=rp3(M,N);
nbins=100;
figure
h=histogram(y3,nbins);
h.Normalization='pdf';
 xlabel 'v[n]';
 ylabel 'PDF';
 title 'N=100000,100 bins';
pd_u=makedist('Uniform','lower',-1,'upper',2);
ax=-1.2:.01:2.2;
pdf_u=pdf(pd_u,ax);
hold on
plot(ax,pdf_u,'r','Linewidth',2);


