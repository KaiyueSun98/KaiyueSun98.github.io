function [MDL, AIC,AICc] = mdl(x,p) % Turned into a function
N = length(x);
for i = 1:p
    [~,E] = aryule(x,i);
    MDL(i) = log10(E) + i*(log10(N)/N);
    AIC(i) = log10(E) + 2*(i/N);
    AICc(i)=AIC(i)+2*i*(i+1)/(N-i-1);
end