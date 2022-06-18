%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3 Spectral Estimation and Modelling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%1.use pgm
clear all
close all
clc

N = 512;   %128  256
x = randn(1, N);
Px = pgm(x);

 %f = linspace(0, 0.5, N/2+1); % Normalized frequencies to 0.5 showing only one symmetric part
 %stem(f, Px(1:N/2+1));

norm_freq = @(N) 0:1/N:(N-1)/N; % Normalized frequencies to 1 showing both symmetric parts
nf = norm_freq(length(x));
stem(nf, Px);

title(['PSD estimate of WGN for N = ' num2str(N)]);
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.1 averaged periodogram estimates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.1.1
clear all
close all
clc

N = 512;
x = randn(1, N);
Px = pgm(x);

a = 1;
b = 0.2*[1 1 1 1 1];

norm_freq = @(N) 0:1/N:(N-1)/N;
nf = norm_freq(length(x));

Px = pgm(x);
Px_s = filter(b, a, Px); % Smoothing

f = linspace(0, 0.5, N/2+1);

hold on
plot(nf, Px, 'DisplayName', 'Original PSD estimate'); % Original PSD
plot(nf, Px_s, 'DisplayName', 'Smoothed PSD estimate'); % Smoothed version
%axis([0 0.5 0 6]);
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
grid on
grid minor
legend('show');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.1 averaged periodogram estimates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.1.2
clear all
close all
clc

N = 32;         %N=8, segs=128, total=1024                     
segs = 32; % Blocks for averaging to give 8 segments
x = randn(segs, N);

Px = pgm(x'); % fft in pgm works on columns of the input matrix
Px_avg = mean(Px'); % Mean of 8 segments

 norm_freq = @(N) 0:1/N:(N-1)/N;
 nf = norm_freq(length(x));
% stem(nf, Px_avg);

%f = linspace(0, 0.5, N/2+1);
figure
plot(nf, Px(:,1));
hold on
plot(nf,Px_avg);
legend('Segment 1','averaged PSD')
%title(['Averaged periodogram for ' num2str(N*segs) ' WGN samples: ' num2str(segs) ' segments']);
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2 spectrum of autoregressive processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2.1
%3.2.2
%3.2.3
clear all
% length of sequence
N = 1064;

% generate random samples
x = randn(1, N);

% filter coefficients
a = [1 0.9];
b = 1;

% filter random sequence
y = filter(b, a, x);

% discard first 40 samples to remove transient effects
y = y(41:end);
figure
plot(x);
hold on
plot(y);
xlabel('sample number');
ylabel('signal amplitude');
legend('x','y')
grid minor
grid on

% obtain ideal PSD of filtered signal
[h, w] = freqz(b, a, 512);  %n point frequency response of the digital filter

% estimate PSD using periodogram
Pn = pgm(y);
Px=pgm(x);
% set linewidth
linewidth = 2;

% plot values
figure
hold on
plot(w/(2*pi), abs(h).^2, 'LineWidth', linewidth);
plot(w/(2*pi), Pn(1:(N-40)/2));
plot(w/(2*pi), Px(1:(N-40)/2));
hold off
%xlim([0.4 0.5]);
% graphing settings
%title('\fontsize{40}PSD of Signal produced using AR(1) Process');
xlabel('Normalised Frequencies (x 2\pi rad/sample)')
ylabel('Magnitude')
legend('Exact PSD of the filter',...
       'Estimated PSD of y','Estimated PSD of x');
 
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2 spectrum of autoregressive processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2.4
%close all
%clear all
%clc


N = 1064;
x = randn(1, N);

% Given filter coefficients
a = [1 0.9];
b = 1;

y = filter(b, a, x);
y = y(41:end); % Remove first 40 samples
acf = xcorr(y, 1, 'unbiased');


a1 = - acf(3)/acf(2);
var = acf(2) + a1 * acf(3);

sd = sqrt(var);

[h, w] = freqz(var^(1/2), [1 a1], 512);

[h_ideal, w_ideal] = freqz(b, a, 512);

Px = pgm(y);

figure
hold on
plot(w/(2*pi), abs(h).^2, 'LineWidth', 2, 'DisplayName', 'Exact PSD of Model-Based filter');
plot(w/(2*pi), Px(1:(N-40)/2), 'DisplayName', 'Estimated PSD of y');
plot(w_ideal/(2*pi), abs(h_ideal).^2, 'LineWidth', 2, 'DisplayName', 'Exact PSD of filter');

axis([0 0.5 0 400]); % For zooming in
%xlim([0.4 0.5])
%title('Model Based PSD Estimate');
xlabel('Normalized Frequency (x 2\pi radians/sample)')
ylabel('Amplitude')
legend('show');
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2 spectrum of autoregressive processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.2.5 
clear all
close all
clc

load sunspot.dat

orders = [1 2 10];

sun(:, 1) = sunspot(:, 2);    % non-centred
sun(:, 1) = zscore(sun(:, 1));%centred
N = length(sun(:, 1));

h_orders = zeros(N, length(orders));

legend_str = cell(1, 1+length(orders));
legend_str{1, 1} = char('Periodogram Estimate of PSD');

for i = 1:length(orders)
    [a, var] = aryule(sun(:, 1), orders(i)); % Use sun(:,2) for normalised data

    [h(:, i), w] = freqz(var^(1/2), a, length(sun(:, 1))/2); % Use sun(:,2) for normalised data
    
    legend_str{1, i+1} = char(sprintf('Model Based Estimate of PSD: Order %d', orders(i))); 
end

Ps = pgm(sun(:, 1)); % Use sun(:,2) for normalised data

f = linspace(0, 0.5, N/2+1);

hold on
plot(f, Ps(1:N/2+1));

for i = 1:length(orders)
    plot(w/(2*pi), abs(h(:, i)).^2);
end

% axis([0 0.2 0 45]); % For zooming in normalised data
%axis([0 0.15 0 7*10^5]); % For zooming in original data

title('mean-centered series');
xlabel('Normalized Frequencies (x 2\pi radians/sample)');
ylabel('Magnitude');
legend(legend_str);
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3 Spectral Estimation and Modelling
%3.5 Real-world signal: Respirator Sinus Arrhythmia from RR_Intervals
%refer to asp_2_5.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%