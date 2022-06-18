%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.1 ACF of uncorrelated and correlated sequences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.1.1   2.1.2
clear
close all
clc
N=1000;
x=randn(1,N);
xacf=xcorr(x,'unbiased');
xacf_50=xacf(950:1050);
ax= linspace(-N+1, N-1, 2*N-1);
ax_50= linspace(-50, 50,101);
%axis([-999 999 -inf inf])
figure
plot(ax,xacf);
xlabel('\tau');
ylabel('R_x(\tau)');

grid on
grid minor
figure
plot(ax_50,xacf_50);
xlabel('\tau');
ylabel('R_x(\tau)')

grid on
grid minor

%zoom on
%results: scaled imperfect Direc  T=0,ACF/1000;T=999,ACF/1. use unbiased to compensate
%windowing 
%symmetry: even function R(T)=R(-T)
%|T|<50, within 0.1, larger |T|,lager ACF estimates
% ACF estimates not accurate: unbiased,large variance;biased,
% small bias for large lag small variance
%small lag, similar biasd(1/N) unbiased(1/(N-T))

%http://web.cecs.pdx.edu/~ssp/Slides/Autocorrelationx4.pdf
%https://stats.stackexchange.com/questions/336117/why-is-the-variance-of-acf-of-white-noise-1-t
%https://dsp.stackexchange.com/questions/17248/autocorrelation-of-white-noise
%http://www.ece.mcmaster.ca/~ibruce/courses/COE4TL4_lecture29.pdf
bound=1.96/sqrt(1000)