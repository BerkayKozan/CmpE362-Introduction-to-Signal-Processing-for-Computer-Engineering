%---------------------------PROBLEM 10---------------------------
Image=imread('lena.png'); %Take the image as input.
Image=rgb2gray(Image); %Convert the image from rgb to gray picture.

%Mean of the Gray image. The variable mean is the mean of the image input.
mean=mean2(Image);

%Standart deviation of the Gray image. The variable std is the standart deviation of the image input.
std=std2(Image);

%the maximum element of the image file
max1= max(Image); %max1= 1x512 array.
max2= transpose(max1); %Flip the matrix, so that we can use max method once again.
max=max(max2); %The maximum element is called max.

%location of the maximum element.
[max_row, max_column] = find(Image == max); %max_row is the row of the maximum element.
%max_column is the column of the maximum element.

%the minimum element of the image file
min1= min(Image); %min1= 1x512 array.
min2= transpose(min1); %Flip the matrix, so that we can use min method once again.
min=min(min2); %The minimum element is called min.

%location of the minimum element.
[min_row, min_column] = find(Image == min); %min_row is the row of the minimum element.
%min_column is the column of the minimum element.