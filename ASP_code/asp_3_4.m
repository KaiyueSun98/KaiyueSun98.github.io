%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3 Spectral Estimation and Modelling
%3.4 spectrogram for time-frequency analysis: dial tone pad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.4.1
clear all
close all
clc

load freq

Fs = 32768; % Given sampling rate
t = 5.25; % Given time duration of total sequence

number = randi([0 9], 1, 8); % 1x8 matrix of random numbers between 0 and 9
number = [0 2 0 number]; % append 020 to phone number

% Since the sine wave is 0.25 seconds long, 8192 samples in 0.25 secs gives a sampling rate of 32768 Hz
x = linspace(0, 0.25, 8192);
y = []; % Output signal

% For 10 digits and 10 blanks
for i=1:10
    
    temp1 = sin(2 * pi * freqs(1, number(i)+1) * x) + sin(2 * pi * freqs(2, number(i)+1) * x); 
    temp2 = zeros(1, 8192);
    y = [y temp1 temp2];
    
end

% Generate 11th number separately since you don't need a blank after this.
temp1 = sin(2 * pi * freqs(1, number(11)+1) * x) + sin(2 * pi * freqs(2, number(11)+1) *x);
y = [y temp1];
ax = linspace(0, 5.25, 172032);

plot(ax,y);
%xlim([0 0.75]); %zoom
title('Time Domain Representation of Signal Generated from Dial Tone Pad');
xlabel('Time(s)')
ylabel('Amplitude')

grid on
grid minor


save 3_4_1
%%
%3.4.2
load 3_4_1

std_n = 0; % Adding noise for subsection 4. Change to 0,2,10,20
n = randn(1, Fs * t) * std_n;
y = y + n;


figure; % time domain signal
x = linspace(0, 5.25, 172032); % signal is 5.25 seconds long with a sampling rate of 32768Hz
plot(x, y);
title(['Time Domain Signal for Landline Number ' num2str(number)]);
xlabel('Time (seconds)')
ylabel('Signal Amplitude')
% axis([0 0.75 -2 2]); % only first 2 numbers and 1st blank
grid on
grid minor

figure; % spectrogram
spectrogram(y, hann(8192), 0, 8192, 32768, 'yaxis'); %noverlap,nfft,fs,freq on y
ylim([0.250 1.750])
title('Spectrogram of Dial Tone Signal');
xlabel('Time (seconds)');

save 3_4_2;
