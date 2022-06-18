%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.1 Wiener filter
%refer to wiener_coeffs.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.1.2
clear
close all
clc
for i=1:10    %i:filter order
[w_opt,SNR,std_y,x,y] = wiener_coeffs(0.1, i);
y_hat = filter(w_opt, 1, x);
MSE(i) = immse(y, y_hat);
end
i=1:10;
figure
plot(i, MSE);
xlabel('N_w (filter order)');
ylabel('mean square error');
title('effect of filter order on the Wiener solution')
grid on
grid minor

    
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.2 The least mean square algorithm
%refer to lms.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.2.1
%4.2.2
clear
close all
clc
N = 1000;
x = randn(N,1);

y = filter([1,2,3,2,1],[1],x);
% y = zscore(y); % Normalizing
sd=0.1;    %0.3162, 0.4, 0.5,1,2,3.162   0.1
n = sd*randn(N,1);
z = n+y;

u=0.01;       %adaption gain   0.005  0.01  0.1 0.4

order=5;

[y_hat, e, a] = lms(x, z, u, order);


%gear shifting

% [y_hat1, e1, w1] = lms_gs(x, z, u, order);
% figure
% hold on;
% plot(e);
% plot(z);
% plot(y_hat);
% xlim([0 100])  %large u
% hold off
% grid minor
% grid on
% 
% xlabel('Sample Number');
% ylabel('Amplitude');
% legend({'Error Signal(e)','Reference Signal(z)','Estimated signal ($\hat{y}$)'});
% title(['Evolution of error using gear shifting: \mu=' num2str(u)]);
% set(legend,'Interpreter','latex')
% ax=1:996;
% figure
% hold on
%  plot(ax,w1(1,:));
%  plot(ax,w1(2,:));
%  plot(ax,w1(3,:));
%  plot(ax,w1(4,:));
%  plot(ax,w1(5,:));
% 
%   xlabel('Sample Number');
%  ylabel('Value of coefficient');
%  title(['Evolution of coefficients using gear shifting \mu=' num2str(u)]);
%  legend('w1','w2','w3','w4','w5');
%    
%  hold off
%  grid minor
%  grid on

figure
hold on;
plot(e);
plot(z);
plot(y_hat);
%xlim([0 100])  %large u
hold off
grid minor
grid on

xlabel('Sample Number');
ylabel('Amplitude');
legend({'Error Signal(e)','Reference Signal(z)','Estimated signal ($\hat{y}$)'});
title(['Evolution of error using LMS algorithm: \mu=' num2str(u)]);
set(legend,'Interpreter','latex')





figure
hold on
 plot(ax,a(1,:));
 plot(ax,a(2,:));
 plot(ax,a(3,:));
 plot(ax,a(4,:));
 plot(ax,a(5,:));
% xlim([0 100])  %large u
 hold off
 
 xlabel('Sample Number');
 ylabel('Value of coefficient');
 title(['Evolution of coefficients \mu=' num2str(u)]);
 legend('w1','w2','w3','w4','w5');
   
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.4 Identification of AR processes
%refer to lms_ar.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

sd = 1;
a = [1 0.9 0.2];
b = 1;
N = 10000;
order=2;
n = sd*randn(N,1);

x = filter(b, a, n);

figure
u = 0.0005;
[~, ~, a] = lms_ar( x, u, order);
hold on
plot(a(1,:))
plot(a(2,:))
title(['Identification of AR(2) process using LMS algorithm \mu=' num2str(u)]);
xlim([0 10000]);
xlabel('Sample number')
ylabel('value of coefficients')
grid on
grid minor
legend('a1','a2')

figure
u = 0.001;
[~, ~, a] = lms_ar( x, u, order);
hold on
plot(a(1,:))
plot(a(2,:))
title(['Identification of AR(2) process using LMS algorithm \mu=' num2str(u)]);
xlim([0 10000]);
xlabel('Sample number')
ylabel('value of coefficients')
grid on
grid minor
legend('a1','a2')


figure
u = 0.01;
[~, ~, a] = lms_ar( x, u, order);
hold on
plot(a(1,:))
plot(a(2,:))
title(['Identification of AR(2) process using LMS algorithm \mu=' num2str(u)]);
xlim([0 10000]);
xlabel('Sample number')
ylabel('value of coefficients')
grid on
grid minor
legend('a1','a2')


figure
u = 0.1;
[~, ~, a] = lms_ar( x, u, order);
hold on
plot(a(1,:))
plot(a(2,:))
title(['Identification of AR(2) process using LMS algorithm \mu=' num2str(u)]);
xlim([0 10000]);
xlabel('Sample number')
ylabel('value of coefficients')
grid on
grid minor
legend('a1','a2')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.5 Speech recognitioin
%refer to lms_ar.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

N = 1000;
%Fs = 44100;
 Fs = 16000; % Uncomment for sampling at 16 kHz

Rp = @(x,e) 10*log10(var(x)/var(e)); % Prediction Gain (given formula)

% Reading voice data and resampling for all letters:
file = 'E.m4a';
[e_temp,f] = audioread(file);
% audiowrite('e.wav', e_temp, Fs);
% e = audioread('e.wav');
e = resample(e_temp,Fs,f);

file = 'A.m4a';
[a_temp,f] = audioread(file);
% audiowrite('a.wav', a_temp, Fs);
% a = audioread('a.wav');
a = resample(a_temp,Fs,f);

file = 'S.m4a';
[s_temp,f] = audioread(file);
% audiowrite('s.wav', s_temp, Fs);
% s = audioread('s.wav');
s = resample(s_temp,Fs,f);

file = 'T.m4a';
[t_temp,f] = audioread(file);
% audiowrite('t.wav', t_temp, Fs);
% t = audioread('t.wav');
t = resample(t_temp,Fs,f);

file = 'X.m4a';
[x_temp,f] = audioread(file);
% audiowrite('x.wav', x_temp, Fs);
% x = audioread('x.wav');
x = resample(x_temp,Fs,f);

%plot(t);

e_voice = e(13000:13999);
a_voice = a(13000:13999);
%s_voice = [s(49000:49599);s(58500:58999)];
t_voice = t(15000:15999);
%x_voice = [x(27500:27999);x(39000:39499)];%eks

% e_voice = e(36000:36999);
% a_voice = a(32500:33499);
% s_voice = [s(49000:49599);s(58500:58999)];
% t_voice = t(40400:41399);
% x_voice = [x(27500:27999);x(39000:39499)];%eks

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% select order of the AR processes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ec_voice=e_voice-mean(e_voice);
ac_voice=a_voice-mean(a_voice);
%sc_voice=s_voice-mean(s_voice);
tc_voice=t_voice-mean(t_voice);
%xc_voice=x_voice-mean(x_voice);





[MDL_e,AIC_e,AICc_e] = mdl(ec_voice,100);
[MDL_a,AIC_a,AICc_a] = mdl(ac_voice,100);
%[MDL_s,AIC_s,AICc_s] = mdl(sc_voice,100);
[MDL_t,AIC_t,AICc_t] = mdl(tc_voice,100);
%[MDL_x,AIC_x,AICc_x] = mdl(xc_voice,100);


% The optimal model order is the minimum value in the matrix
[~,IMDL_e] = min(MDL_e);
[~,IMDL_a] = min(MDL_a);
%[~,IMDL_s] = min(MDL_s);
[~,IMDL_t] = min(MDL_t);
%[~,IMDL_x] = min(MDL_x);

[~,IAIC_e] = min(AIC_e);
[~,IAIC_a] = min(AIC_a);
%[~,IAIC_s] = min(AIC_s);
[~,IAIC_t] = min(AIC_t);
%[~,IAIC_x] = min(AIC_x);

[~,IAICc_e] = min(AICc_e);
[~,IAICc_a] = min(AICc_a);
%[~,IAICc_s] = min(AICc_s);
[~,IAICc_t] = min(AICc_t);
%[~,IAICc_x] = min(AICc_x);

fprintf('The optimal model order for the letters are: \n')
fprintf('e_MDL = %d\n',IMDL_e)
fprintf('e_AIC = %d\n',IAIC_e)
fprintf('e_AIC = %d\n',IAICc_e)
fprintf('a_MDL = %d\n',IMDL_a)
fprintf('a_AIC = %d\n',IAIC_a)
fprintf('a_AIC = %d\n',IAICc_a)
% fprintf('s_MDL = %d\n',IMDL_s)
% fprintf('s_AIC = %d\n',IAIC_s)
% fprintf('s_AIC = %d\n',IAICc_s)
fprintf('t_MDL = %d\n',IMDL_t)
fprintf('t_AIC = %d\n',IAIC_t)
fprintf('t_AIC = %d\n',IAICc_t)
% fprintf('x_MDL = %d\n',IMDL_x)
% fprintf('x_AIC = %d\n',IAIC_x)
% fprintf('x_AIC = %d\n',IAICc_x)

% figure
% hold on
% plot(MDL_e(1:20));
% plot(AIC_e(1:20));
% plot(AICc_e(1:20));
% hold off
% legend('MDL','AIC','AICc');
fprintf('Rp for "e_MDL" = %f\n',Rp(e,ee_MDL))
fprintf('Rp for "e_AIC" = %f\n',Rp(e,ee_AIC))
fprintf('Rp for "e_AICC" = %f\n',Rp(e,ee_AIC))
fprintf('Rp for "a_MDL" = %f\n',Rp(e,ae_MDL))
fprintf('Rp for "a_AIC" = %f\n',Rp(e,ae_AIC))
fprintf('Rp for "a_AICC" = %f\n',Rp(e,ae_AIC))

fprintf('Rp for "t_MDL" = %f\n',Rp(e,te_MDL))
fprintf('Rp for "t_AIC" = %f\n',Rp(e,te_AIC))
fprintf('Rp for "t_AICC" = %f\n',Rp(e,te_AIC))


%%



order_a= 10; % Filter order
order_e= 10;
order_s= 10;
order_t= 10;
order_x= 10;

u = 0.01;
[e_predict_AICc,ee_AICc,e_w_AICc] = lms_ar(ec_voice, u, order_a);
[a_predict_AICc,ae_AICc,a_w_AICc] = lms_ar(ac_voice, u, order_e); 
[s_predict_AICc,se_AICc,s_w_AICc] = lms_ar(sc_voice, u, order_s);
[t_predict_AICc,te_AICc,t_w_AICc] = lms_ar(tc_voice, u, order_t);
[x_predict_AICc,xe_AICc,x_w_AICc] = lms_ar(xc_voice, u, order_x);


figure(1)
hold on
for i = 1:length(e_w_AICc(:,1))
    plot(e_w_AICc(i,1:991));
end
hold off
title('Evolution of the coefficients for letter "e"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%a

figure(2)
hold on
for i = 1:length(a_w_AICc(:,1))
    plot(a_w_AICc(i,1:991));
end
hold off
title('Evolution of the coefficients for letter "a"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%s

figure(3)
hold on
for i = 1:length(s_w_AICc(:,1))
    plot(s_w_AICc(i,1:991));
end
hold off
title('Evolution of the coefficients for letter "s"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%t

figure(4);
hold on
for i = 1:length(t_w_AICc(:,1))
    plot(t_w_AICc(i,1:991));
end
hold off
title('Evolution of the coefficients for letter "t"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%x
figure(5);
hold on
for i = 1:length(x_w_AICc(:,1))
    plot(x_w_AICc(i,1:991));
end
hold off
title('Evolution of the coefficients for letter "x"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LMS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Applying LMS:
order_a= IMDL_a; % Filter order
order_e= IMDL_e;
%order_s= IMDL_s;
order_t= IMDL_t;
%order_x= IMDL_x;

u = 0.01;
[e_predict_MDL,ee_MDL,e_w_MDL] = lms_ar(e_voice, u, order_a);
[a_predict_MDL,ae_MDL,a_w_MDL]  = lms_ar(a_voice, u, order_e); 
%[s_predict_MDL,se_MDL,s_w_MDL]  = lms_ar(s_voice, u, order_s);
[t_predict_MDL,te_MDL,t_w_MDL] = lms_ar(t_voice, u, order_t);
%[x_predict_MDL,xe_MDL,x_w_MDL]  = lms_ar(x_voice, u, order_x);


order_a= IAIC_a; % Filter order
order_e= IAIC_e;
%order_s= IAIC_s;
order_t= IAIC_t;
%order_x= IAIC_x;

u = 0.01;
[e_predict_AIC,ee_AIC,e_w_AIC] = lms_ar(e_voice, u, order_a);
[a_predict_AIC,ae_AIC,a_w_AIC] = lms_ar(a_voice, u, order_e); 
%[s_predict_AIC,se_AIC,s_w_AIC] = lms_ar(s_voice, u, order_s);
[t_predict_AIC,te_AIC,t_w_AIC] = lms_ar(t_voice, u, order_t);
%[x_predict_AIC,xe_AIC,x_w_AIC] = lms_ar(x_voice, u, order_x);



order_a= IAICc_a; % Filter order
order_e= IAICc_e;
%order_s= IAICc_s;
order_t= IAICc_t;
%order_x= IAICc_x;

u = 0.01;
[e_predict_AICc,ee_AICc,e_w_AICc] = lms_ar(e_voice, u, order_a);
[a_predict_AICc,ae_AICc,a_w_AICc] = lms_ar(a_voice, u, order_e); 
%[s_predict_AICc,se_AICc,s_w_AICc] = lms_ar(s_voice, u, order_s);
[t_predict_AICc,te_AICc,t_w_AICc] = lms_ar(t_voice, u, order_t);
%[x_predict_AICc,xe_AICc,x_w_AICc] = lms_ar(x_voice, u, order_x);

fprintf('Rp for "e_MDL" = %f\n',Rp(e,ee_MDL))
fprintf('Rp for "e_AIC" = %f\n',Rp(e,ee_AIC))
fprintf('Rp for "e_AICC" = %f\n',Rp(e,ee_AICc))
fprintf('Rp for "a_MDL" = %f\n',Rp(e,ae_MDL))
fprintf('Rp for "a_AIC" = %f\n',Rp(e,ae_AIC))
fprintf('Rp for "a_AICC" = %f\n',Rp(e,ae_AICc))
% fprintf('Rp for "s_MDL" = %f\n',Rp(e,se_MDL))
% fprintf('Rp for "s_AIC" = %f\n',Rp(e,se_AIC))
% fprintf('Rp for "s_AICC" = %f\n',Rp(e,se_AIC))
fprintf('Rp for "t_MDL" = %f\n',Rp(e,te_MDL))
fprintf('Rp for "t_AIC" = %f\n',Rp(e,te_AIC))
fprintf('Rp for "t_AICC" = %f\n',Rp(e,te_AICc))
% fprintf('Rp for "x_MDL" = %f\n',Rp(e,xe_MDL))
% fprintf('Rp for "x_AIC" = %f\n',Rp(e,xe_AIC))
% fprintf('Rp for "x_AICC" = %f\n',Rp(e,xe_AIC))

%%
% % Applying gearshifting:
% [e_predict,ee,e_w] = lms_gs(e_shift, e_voice, gain, order); 
% [a_predict,ae,a_w] = lms_gs(a_shift, a_voice, gain, order);
% [s_predict,se,s_w] = lms_gs(s_shift, s_voice, gain, order); 
% [t_predict,te,t_w] = lms_gs(t_shift, t_voice, gain, order); 
% [x_predict,xe,x_w] = lms_gs(x_shift, x_voice, gain, order); 


% Uncomment the code below line 77 to line 145 to generate coefficient plots.

%e

figure(1)
hold on
for i = 1:length(e_w_AICc(:,1))
    plot(e_w_AICc(i,1:997));
end
hold off
title('Evolution of the coefficients for letter "e"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%a

figure(2)
hold on
for i = 1:length(a_w_AICc(:,1))
    plot(a_w_MDL(i,1:990));
end
hold off
title('Evolution of the coefficients for letter "a"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%s

figure(3)
hold on
for i = 1:length(s_w_AICc(:,1))
    plot(s_w_AICc(i,1:997));
end
hold off
title('Evolution of the coefficients for letter "s"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%t

figure(4);
hold on
for i = 1:length(t_w_AICc(:,1))
    plot(t_w_MDL(i,1:987));
end
hold off
title('Evolution of the coefficients for letter "t"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%x
figure(5);
hold on
for i = 1:length(x_w_AICc(:,1))
    plot(x_w_AICc(i,1:995));
end
hold off
title('Evolution of the coefficients for letter "x"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor

%%

u = 0.01;
[e_predict,ee20,e_w] = lms_ar(e_voice, u, 20);
[e_predict,ee15,e_w15] = lms_ar(e_voice, u, 15);
[e_predict,ee10,e_w10] = lms_ar(e_voice, u, 10);
[e_predict,ee5,e_w] = lms_ar(e_voice, u, 5);
[e_predict,ee1,e_w] = lms_ar(e_voice, u, 1);
fprintf('Rp for "20" = %f\n',Rp(e,ee20))
fprintf('Rp for "15" = %f\n',Rp(e,ee15))
fprintf('Rp for "10" = %f\n',Rp(e,ee10))
fprintf('Rp for "5" = %f\n',Rp(e,ee5))
fprintf('Rp for "1" = %f\n',Rp(e,ee1))
figure(1)
hold on
for i = 1:length(e_w10(:,1))
    plot(e_w10(i,1:984));
end
hold off
title('Evolution of the coefficients for letter "e"');
xlabel('Sample');
ylabel('Coefficients');
grid on
grid minor


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.6 sign algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
close all
clc
sd = 1;
a = [1 0.9 0.2];
b = 1;
N = 10000;
order=2;
n = sd*randn(N,1);

x = filter(b, a, n);



figure
u = 0.001;
[~, ~, a] = lms_ar_sign_sign( x, u, order);
hold on
plot(a(1,:))
plot(a(2,:))
title(['Identification of AR(2) process using Sign-sign \mu=' num2str(u)]);
xlim([0 10000]);
xlabel('Sample number')
ylabel('value of coefficients')
grid on
grid minor
legend('a1','a2')





