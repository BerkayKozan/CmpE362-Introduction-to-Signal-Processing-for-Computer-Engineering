%---------------------------PROBLEM 9---------------------------
figure(9);
M = csvread('exampleSignal.csv',3); %Read the file
plot(M) %Plot the signal itself.
hold on %Wait for the peaks to enter.
[pks,locs] = findpeaks(M); %pks are peaks, locations are locations of peaks.
plot(locs,pks,'.r') %Add the peaks from findpeaks method to the same figure with color red.