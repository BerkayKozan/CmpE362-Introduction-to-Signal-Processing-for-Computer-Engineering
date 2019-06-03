M = csvread('exampleSignal.csv',3); %Read the file
plot(M);
unfilteredPeaks= findpeaks(M);
movingFilterSamples = zeros(1,30); %The moving filter samples for N from 2 to 30.
peakNumber = zeros(1,length(movingFilterSamples)); %The number of peaks for each discrete value of N.

for i= 2:30
    movingFilterSamples(i)=i;
    b = (1/i)*ones(1,i);
    a = 1;
    x= M;
    filteredData = filter(b,a,x);
    peaks= findpeaks(filteredData);
    peakNumber(i)= length(peaks);    
end

movingFilterSamples(1)= 0; %For including unfiltered peaks to the plot, N=0 is used.
peakNumber(1)= length(unfilteredPeaks);
figure;
plot(movingFilterSamples, peakNumber); 
title('The number of peaks versus N');