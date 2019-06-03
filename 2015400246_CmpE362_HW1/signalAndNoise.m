%%%%%  Problem 1  %%%%%
figure(1);

% Creates 1000 points in this interval.
x = linspace(-100,100,1000); 

y1 = sin(x);
y2 = sin(50 * x);
y3 = 50 * sin(x);
y4 = sin(x) + 50;
y5 = sin(x + 50);
y6 = 50 * sin(50 * x);
y7 = x .* sin(x);
y8 = sin(x) ./ x;

% Puts all vectors inside another vector in the order.
funcs = [y1 ; y2 ; y3 ; y4 ; y5 ; y6 ; y7 ; y8];

% Displays all functions
for n=1:8
    subplot(4,2,n);
    plot(x, funcs(n,:));
end


%%%%%  Problem 2  %%%%%
figure(2);

% Creates 1000 points in this interval.
x = linspace(-20,20,1000);

y1 = sin(x);
y2 = sin(50 * x);
y3 = 50 * sin(x);
y4 = sin(x) + 50;
y5 = sin(x + 50);
y6 = 50 * sin(50 * x);
y7 = x .* sin(x);
y8 = sin(x) ./ x;
y9 = y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8;

% Puts all vectors inside another vector in the order.
funcs = [y1 ; y2 ; y3 ; y4 ; y5 ; y6 ; y7 ; y8 ; y9];
   
% Displays all functions
for n=1:9
    subplot(5,2,n);
    plot(x, funcs(n,:));
end


%%%%%  Problem3  %%%%%
figure(3);

% Creates 41 points in this interval.
x = linspace(-20,20,41);

% Creates 41 zero-mean, unit variance Gaussian distributed random numbers
z = randn(1,41);

y10 = z;
y11 = z + x;
y12 = z + sin(x);
y13 = z .* sin(x);
y14 = x .* sin(z);
y15 = sin(x + z);
y16 = z .* sin(50 * x);
y17 = sin(x + (50 * z));
y18 = sin(x) ./ z;
y19 = y11+y12+y13+y14+y15+y16+y17+y18;

% Puts all vectors inside another vector in the order.
funcs = [y10 ; y11 ; y12 ; y13 ; y14 ; y15 ; y16 ; y17 ; y18 ; y19];
   
% Displays all functions
for n=1:10
    subplot(5,2,n);
    plot(x, funcs(n,:));
end


%%%%%  Problem4  %%%%%
figure(4);

% Creates 41 points in this interval.
x = linspace(-20,20,41);

% Creates 41 uniformly distributed random numbers in [0,1].
z = rand(1,41);

y20 = z;
y21 = z + x;
y22 = z + sin(x);
y23 = z .* sin(x);
y24 = x .* sin(z);
y25 = sin(x + z);
y26 = z .* sin(50 * x);
y27 = sin(x + (50 * z));
y28 = sin(x) ./ z;
y29 = y21+y22+y23+y24+y25+y26+y27+y28;

funcs = [y20 ; y21 ; y22 ; y23 ; y24 ; y25 ; y26 ; y27 ; y28 ; y29];
   
for n=1:10
    subplot(5,2,n);
    plot(x, funcs(n,:));
end


%%%%%  Problem5  %%%%%
figure(5);
r1 = randn(1,10000);
r2 = 2 * randn(1,10000);
r3 = 4 * randn(1,10000);
r4 = 16 * randn(1,10000);

funcs = [r1 ; r2 ; r3 ; r4];
   
for n=1:4
    subplot(2,2,n);
    hist(funcs(n,:));
end


%%%%%  Problem6  %%%%%
figure(6);
r6 = randn(1,10000) + 10;
r7 = (2 * randn(1,10000)) + 20;
r8 = randn(1,10000) - 10;
r9 = (2 * randn(1,10000)) - 20;

funcs = [r6 ; r7 ; r8 ; r9];
   
for n=1:4
    subplot(2,2,n);
    hist(funcs(n,:));
end


%%%%%  Problem7  %%%%%
figure(7);
r11 = sqrt(12)*(rand(1,10000)-0.5);
r21 = sqrt(12)*2 * (rand(1,10000)-0.5);
r31 = sqrt(12)*4 * (rand(1,10000)-0.5);
r41 = sqrt(12)*16 * (rand(1,10000)-0.5);

funcs = [r11 ; r21 ; r31 ; r41];
   
for n=1:4
    subplot(2,2,n);
    hist(funcs(n,:));
end


%%%%%  Problem8  %%%%%
figure(8);
r61 = sqrt(12)*(rand(1,10000)- 0.5) + 10;
r71 = (sqrt(12)*2 * (rand(1,10000)- 0.5)) + 20;
r81 = sqrt(12)*(rand(1,10000)- 0.5) - 10;
r91 = (sqrt(12)*2 * (rand(1,10000)- 0.5)) - 20;

funcs = [r61 ; r71 ; r81 ; r91];
   
for n=1:4
    subplot(2,2,n);
    hist(funcs(n,:));
end