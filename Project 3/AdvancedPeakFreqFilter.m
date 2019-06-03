clear; 
clc;
hfile = 'PinkPanther30.wav';  % This is a string, corresponding to the filename
clear y Fs  % Clear unneded variables

[y, Fs] = audioread(hfile); % Read the data back into MATLAB, and listen to audio.

peaks_without_filter= findpeaks(y); %Peaks of no filter.
cutoffs = [1000, 2000, 3000, 4000, Fs]; %Cutoff frequencies for each iteration.
number_of_cutoffs = length(cutoffs); %Number of cutoffs to iterate.
number_of_peaks = zeros(1,number_of_cutoffs); %Number of peaks for each iteration, it is array of zeros initially. We will change the values.

for i= 1: number_of_cutoffs-1
    z = lowpass(y,cutoffs(i),Fs); %z is lowpass filtered version of data, with specified cutoff frequency.
    peaks= findpeaks(z); 
    n_peaks= length(peaks); %number of peaks for z.
    number_of_peaks(i)=n_peaks; %Save this to an array.
end

% Add no filter result to last index
number_of_peaks(number_of_cutoffs) = length(peaks_without_filter);

figure(1);
plot(cutoffs, number_of_peaks);     

ax=gca;
ax.YRuler.Exponent = 0; %Set exponent of Y to zero to see whole number of peaks.
ax.XRuler.Exponent = 0; %Set exponent of X to zero to see whole frequency.

title('Number of peaks vs. Changing cut off frequencies (Hz)');