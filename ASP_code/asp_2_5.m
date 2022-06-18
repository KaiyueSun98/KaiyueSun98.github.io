%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 Linear stochastic modelling
%2.5 Real-world signal: ECG from iAmp experiment 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%ECG to RRI
% not change parameter, remove anomoly
clear
clc
close all
load RAW.mat

int1_finish = 2.36*10^5;
int2_begin = 2.37*10^5;
int2_finish = 5.08*10^5;
int3_begin = 5.12*10^5;
int3_finish = 6.448*10^5;

Trial_1 = data(1:int1_finish);
Trial_2 = data(int2_begin:int2_finish);
Trial_3 = data(int3_begin:int3_finish);

[RRI_1,fs1] = ECG_to_RRI(Trial_1,fs);
[RRI_2,fs2] = ECG_to_RRI(Trial_2,fs);
[RRI_3,fs3] = ECG_to_RRI(Trial_3,fs);

save('RRI.mat')
%%
%RRI to heart rate h[n]
clear
close all
clc

load RRI.mat
hr = 60./RRI_1;
h=histogram(hr);
h.Normalization='pdf';
xlim([40 140]);
%pdf(h)
title('Probability Density Estimate (PDE) of original heart rate'); 
ylabel('Probability'); 
xlabel('Heart Rate (BPM)');
grid on
grid minor
%%
%2.5 (a)
%Smoother heart rate h[n] by averaging
clear all
clc
load RRI.mat

a1 = 1;
a2 = 0.6;

hr = 60./RRI_1;

hr=hr(:,1:940);
hr_avg = reshape(hr,[10 94]);

hr_avg_a1 = zeros(1,size(hr_avg,2)); %size of dimension 2: 94 
for i = 1:size(hr_avg_a1,2)
    hr_avg_a1(i) = (1/10)*a1*sum(hr_avg(:,i));
end

hr_avg_a2 = zeros(1,size(hr_avg,2));
for i = 1:size(hr_avg_a2,2)
    hr_avg_a2(i) = (1/10)*a2*sum(hr_avg(:,i));
end

subplot(3,1,1)
h=histogram(hr,40);
h.Normalization='pdf';
axis([0 200 0 .25]);

ylabel('probability')
title('PDE of original heart rate')
grid on
grid minor

subplot(3,1,2)
h=histogram(hr_avg_a1,30);
h.Normalization='pdf';
axis([0 200 0 .25]);
title(['PDE of averaged heart rate for \alpha = ' num2str(a1)]);
ylabel('probability')
grid on
grid minor

subplot(3,1,3)
h=histogram(hr_avg_a2,30);
h.Normalization='pdf';
axis([0 200 0 .25]);
title(['PDE of averaged heart rate for \alpha = ' num2str(a2)])
ylabel('probability')
xlabel('Heart Rate (BPM)')
grid on
grid minor
%%
%2.5 (c)
clear all
close all
clc

load RRI.mat

rr1(:, 1) = detrend(RRI_1);
N1 = length(rr1(:, 1));
corr1(:, 1) = xcorr(rr1(:, 1),'unbiased');
% scale corr to have a value of 1 at tau = 0
corr1(:, 1) = corr1(:, 1)/corr1(N1, 1);
x1 = linspace(-N1+1, N1-1, 2*N1-1);
subplot(3,1,1)
stem(x1, corr1(:, 1));
axis([0 300 -1 1]);

title('ACF of RRI Trial 1');
xlabel('\tau');
ylabel('Amplitude');
grid on
grid minor


rr2(:, 2) = detrend(RRI_2);
N2 = length(rr2(:, 2));
corr2(:, 2) = xcorr(rr2(:, 2),'unbiased');
corr2(:, 2) = corr2(:, 2)/corr2(N2, 2);
x = linspace(-N2+1, N2-1, 2*N2-1);
subplot(3,1,2)
stem(x, corr2(:, 2));
axis([0 300 -1 1]);

title('ACF of RRI Trial 2');
xlabel('\tau');
ylabel('Amplitude');
grid on
grid minor


rr3(:, 3) = detrend(RRI_3);
N3 = length(rr3(:, 3));
corr3(:, 3) = xcorr(rr3(:, 3),'unbiased');
corr3(:, 3) = corr3(:, 3)/corr3(N3, 3);
x = linspace(-N3+1, N3-1, 2*N3-1);
subplot(3,1,3)
stem(x, corr3(:, 3));
% axis tight
axis([0 300 -1 1]);

title('ACF of RRI Trial 3');
xlabel('\tau');
ylabel('Amplitude');
grid on
grid minor



%%
clear all
close all
clc
%2.5 (d) Model selection criteria
load RRI.mat
order = 30;

trial = 3;


h_data(:, 1) = RRI_3;   %RRI_2   RRI_1
h_data(:, 2) = zscore(h_data(:, 1));
N = length(h_data(:, 1));


coefs = zeros(order, order+1);
e = zeros(order, 1);
MDL = zeros(order, 1);
AIC = zeros(order, 1);

% for loop to run through all orders
for i = 1:order
    [coefs(i, 1:i+1), e(i, 1)] = aryule(h_data(:, 2), i);
    MDL(i, 1) = log(e(i, 1)) + i * log(N) / N;
    AIC(i, 1) = log(e(i,1)) + 2 * i / N;    
    AICc(i,1)=AIC(i,1)+2*i*(i+1)/(N-1-i);
end
    


% generate x axis
x = linspace(1, order, order);

% set Line Width
line_width = 2;

% plot values
figure
hold on;
plot(x, MDL, 'LineWidth', line_width);
plot(x, AIC, 'LineWidth', line_width); 
plot(x, AICc, 'LineWidth', line_width); 
plot(x, log(e), 'LineWidth', line_width); 
hold off;

% graphing settings
str = sprintf('Model Order Selection Criteria: RRI Trial %d', trial);
title(str, 'FontSize', 15);
xlabel('Model Order')
ylabel('Magnitude')
legend( 'MDL',...
        'AIC',...
        'AICc',...
        'Loss Function');

grid on 
grid minor


  

%%
%2.5 (d) PAC
%clear all
%close all
%clc
% loading RRI data
load RRI.mat
for j=1:3
if j==1
   hr=RRI_1;
elseif j==2
       hr=RRI_2;
else   
       hr=RRI_3;
end

par_corr_len = 20;
a = 0.1;
hr=zscore(hr);
par_corr = zeros(par_corr_len,1);

for i = 1:par_corr_len
       coefs = aryule(hr, i);
       par_corr(i) = -coefs(i+1);
end


x = linspace(1, par_corr_len, par_corr_len);
y = a*ones(par_corr_len, 1);

gold = [0.9290 0.6940 0.1250];

figure
hold on;
stem(x,par_corr,'DisplayName','Zero Mean PCF');
plot(x, y, '--', 'Color', gold);
plot(x, -y, '--', 'Color', gold);
hold off;

grid on;
grid minor;
xlabel('a');
ylabel('PCF');
title(['Partial Correlation of RRI Trial' num2str(j)]);
legend('Zero Mean PCF');
axis([1 par_corr_len -1 1])

end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.Spectral estimation and modelling
%3.5 Real-world signal: Respirator Sinus Arrhythmia from RR_Intervals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
clc
close all
load RRI.mat
trial_num=3;  %1 or 2 or 3
RRI = zscore(RRI_3);   %RRI_1, RRI_2, RRI_3

%fs1=fs2=fs3=4
N50  = 200;  %4*50;    for 50 seconds
N150 = 600;  %4*150;

PSD = pgm(RRI);

% For window length of 50 seconds
seg_50 = floor(length(RRI)/N50);      % # of segment: RRI_1: seg50=4,seg150=1
RRI_avg_50 = zeros(1, N50);           %               RRI_1: seg50=5,seg150=1
PSD50 = zeros(1, N50);                %               RRI_1: seg50=4,seg150=1

for i = 0:seg_50-1
    RRI_avg_50 =  RRI(i*N50 + 1:(i+1)*N50);
    PSD50 = PSD50 +pgm(RRI_avg_50);
end

PSD50 = PSD50 ./ seg_50;
PSD_avg_50 = pgm(PSD50);


% For window length of 150 seconds
seg_150 = floor(length(RRI)/N150);
RRI_avg_150 = zeros(1, N150);
PSD150 = zeros(1, N150);

for i = 0:seg_150-1
    RRI_avg_150 = RRI(i*N150 + 1:(i+1)*N150);
    PSD150 = PSD150 + pgm(RRI_avg_150);
end

PSD150 = PSD150 ./ seg_150;
PSD_avg_150 = pgm(PSD150);


figure(1)
plot((0:length(PSD)/2 - 1)/length(PSD),PSD(1:length(PSD)/2))
%ylim([0 40]) % For all trials
title(['PSD of RRI Trial ' num2str(trial_num)])
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
xlim([0 0.1]);
grid on
grid minor


figure(2)
plot((0:99)/200, PSD50(1:100))
title(['PSD of RRI Trial ' num2str(trial_num) ' (50 seconds average)'])
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
xlim([0 0.1]);
grid on
grid minor


figure(3)
plot((0:299)/600, PSD150(1:300))
title(['PSD of RRI Trial ' num2str(trial_num) ' (150 seconds average)']);
xlabel('Normalized Frequency (x 2\pi radians per sample)')
ylabel('PSD')
xlim([0 0.1]);
grid on
grid minor

