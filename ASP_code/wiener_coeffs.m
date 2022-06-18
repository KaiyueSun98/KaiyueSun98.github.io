%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.1 Wiener filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.1.1
%4.1.2
% Call function in the command window as [a,b,c] = wiener_coeffs(sd, N_w)
% sd is the standard deviation of the noise and N_w is the ORDER of the
% filter

function [w_opt, SNR, std_y, x,y] = wiener_coeffs(sd, Nw)

Nw=Nw+1;
N = 1000;
x = randn(N,1);

y = filter([1,2,3,2,1],[1],x);
std_y = std(y);

% y = zscore(y); % Normalizing

n = sd*randn(N,1);
z = n+y;

sig_pow = sum(y.^2)/N;     % as mean(x)=0, y=w0x0+w1x1+w1x2.... so mean(y)=0
noise_pow = sum(n.^2)/N;

SNR = 10*log10(sig_pow/noise_pow);

rxx_c = xcorr(x,'unbiased');

R_xx = zeros(Nw,Nw);

for i = 1:Nw
    R_xx(:,i) = rxx_c(N-i+1:N+Nw-i);
end

p_zx = xcorr(z,x,'unbiased');
p_zx = p_zx(N:N+Nw-1);

w_opt = R_xx\p_zx; %x = A\b is computed differently than x = inv(A)*b and is recommended for solving systems of linear equations.

end