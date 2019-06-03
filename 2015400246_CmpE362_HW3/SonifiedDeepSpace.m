clear;
clc;
Image=imread('Hubble-Massive-Panorama.png'); %Take the image as input.
gray= rgb2gray(Image); %Gray image.
binaryimage= imbinarize(gray); %Binarize gray image, each pixel is either 1 or 0.
dimension_length= size(binaryimage); 
column_length= dimension_length(2); %number of columns
row_length= dimension_length(1); %number of rows

T = (0:0.001:1);  %Sampling number.
wavefile=[];

for i=1:column_length %1024 times, for each column.
    sum=zeros(1,length(T)); 
    for j=1:row_length %900 times, for each row(length of column)
        if binaryimage(j,i)==1 %If the pixel is non-black.
            Amp=fix((j-1)/90)+1; %Amplitude's formula. j-1 is here, because at 90th item, index shouldn't change. It should change at next item.
            sum= sum+ (Amp*cos(2*pi*j*T)); %Summation of column.
        else
            Amp= 0;
            sum= sum+ (Amp*cos(2*pi*j*T)); %This will be 0, because Amp=0.
        end
    end
    wavefile= cat(2, sum, wavefile);
end
plot(wavefile);
disp(length(T));
title(strcat('Values of Wavefile, with sample rate: ', num2str(length(T))));
audiowrite("SonifiedDeepSpace.wav",wavefile,length(T));
sound(wavefile, length(T)); % Sounds the data.