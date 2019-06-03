[y, fs] = audioread('mike.wav');
K=100; %default K value is 100 miliseconds.
delayedVersion= delaySignal(y, fs, K);
mixed= delayedVersion+y;

%Use constant N and K, change alpha from 0 to 1 and plot SNR of mike.wav and recovered signal.
N=20;
K=100;
alphaMatrix= 0:0.01:1; %Alphas increment 0.01 in each cell.
SNR1= zeros(length(alphaMatrix),1);

for i=1:length(alphaMatrix)
    ntFiltered = nTapFilter(alphaMatrix(i),N,K,mixed,fs);
    SNR1(i)= getSNR(y, ntFiltered);
end
figure();
plot(alphaMatrix, SNR1);
title('SNR versus alpha, constant N(20) and K(100), changing alpha from 0 to 1');

%Use constant alpha and K, change N from 1 to 50 and plot SNR of mike.wav and recovered signal.
K=100;
alpha=0.9;
NMatrix= 1:50;
SNR2= zeros(length(NMatrix),1);
for i=1:length(NMatrix)
	ntFiltered = nTapFilter(alpha,NMatrix(i),K,mixed,fs);
    SNR2(i)= getSNR(y, ntFiltered);
end
figure();
plot(NMatrix, SNR2);
title('SNR versus N, constant alpha(0.9) and K(100), changing N from 1 to 50');

%Use constant alpha and N, change K between 100,200,300,400 miliseconds and plot SNR of mike.wav and recovered signal.
N= 20;
alpha= 0.9;
KMatrix= [100 200 300 400];
SNR3= zeros(length(KMatrix),1); %The matrix of SNRs.

for i=1:length(KMatrix)
    mixed2= delaySignal(y, fs, KMatrix(i))+y; %THE DELAYED VERSION OF INITIAL SIGNAL TO BE COMBINED AS MIXED IS ALSO CHANGING!
    ntFiltered = nTapFilter(alpha,N,KMatrix(i),mixed2,fs); 
    SNR3(i)= getSNR(y, ntFiltered);
end
figure();
plot(KMatrix, SNR3);
title('SNR versus K, constant alpha(0.9) and N(20), changing K from 100 to 400 ms');

%The N-tap filter.
function result= nTapFilter(alpha, N, K, signal, fs)
    result= signal;
    for i= 1:N
        signal= delaySignal(signal,fs,K);
        result= result + (alpha*(-1))^i * signal; 
    end
end

%Create delayed signals, given frequency and K.
function result= delaySignal(signal, fs, K)
    delayAmount= fs *K/1000;
    len= length(signal);
    result= zeros(len,1);
    for i= delayAmount+1:len
        result(i)= signal(i- delayAmount);
    end
end

%Calculate SNR for 2 signals.
function SNR= getSNR(original, watermarked)
    SNR= 10 * log10(sum(original.^2) ./ sum((watermarked-original).^2));
end