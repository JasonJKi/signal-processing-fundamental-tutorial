% basic tutorial on sampling and generating discrete waveform in MATLAB
clear all; close all;
%A. defining sampling rate and input range            
fs = 100;   % 1)define the number of points that we want to sample
            % in one unit length for our waveform. This is called the
            % sampling rate (fs).
l = 2*pi    % 2) we define the length of 1 unit. Here, 
            % we use radian scale, and we set the length to 2 x pi (360 in degree scale)
            % which equals to the length of the arc in a unit circle.
dx = l/fs;  % 3) we want to get the approximiate length per sample. 
            % dist. per sample = length / sampling rate. This is the rate
            % of change of our discrete series.
x = -l:dx:l; % 4) we set the range of our x axis. Here, I chose 
            % from the ranges of -2 x pi to 2 x pi. MATLAB has a built in
            % matrix indexing operator which creates a regularly-spaced 
            % vector x using dx as the increment between elements. 
            % x=min:index:max;
            % In most general programming, this would need to be done using a
            % for loop. Excersise: Try making the array above using a for loop.

%B. sinuosidal waveform
f = 2;      % 1) we define the frequency of our waveform.
w = (2*pi*f);     % 2) we set the angular frequency which is a scalar measure
            % of the rotation rate.
phase = 0;  % 3) phase, this value determines the initial angle of a sinusoidal function 
            % at its origin. This could be thought of as a shift.
theta = (w*x)/l+phase; % now we can take our discrete samples above and scale and set the offset.
            % theta is an arbitray greek alphabet which is used to describe
            % angles. notice that we have to rescale our angular frequency
            % because the unit scale of our sampling is 2*pi. 
y1 = sin(theta); % 5)  using matlab's built in sin function. we can plug in our input array
            % and generate a simple sin wave output. Also try cos(),tan(),atan(),
            % etc.
y2 = cos(theta); % another waveform

% Plotting
% We demonstrate a simple and clean way of writing a MATLAB script to
% generate plots step-by-step.
figure(1);  % opens a new figure window with index of 1.
clf;        % convention to clear the memory for the current figure.
subplot(3,1,1);     % subplot gridizes the the figure window row by column. 
            % subplot(num rows, num columns, index). here we want to create
            % a grided figure of 3 by 1 for our 3 plots.
plot(x,y1,'o-')
grid on;
subplot(3,1,2)
plot(x,y2,'or-')
grid on;

subplot(3,1,3)
hold on;    % the hold function allows you to draw multiple figures on to the plot
            % by default. hold off by default.
plot(x,y1,'o-')
plot(x,y2,'or-')
legend('sin','cos')
grid on;

% Excersises
% 1. run the plot above
% 2. generate a sinusoids of .5Hz ,1 Hz, 4Hz and 10Hz. 
% 3. generate a sinusoid with period .5, 1, 4, 10. (hint period = 1/frequency)
% 4. change the theta to see what happens to the sinusoid
% 5. generate a 5 hz sinusoid but adjust the sampling rate (fs) to 50,25,11,8,5 Hz.
% 6. change the theta of the y1 to pi/2. observe what happens. Which way
% does the function shift.
% 7. try changing the xaxis so that the range is 0 to two unit circles in
% length. play around with change the x range.
% 8. generate a sinusoid plot containing 2,3,7,11 full waves within range indicated in 2.
% 9. change the sampling scale to time series.

% generating a sin waveform in 2 dimensions.
% sampling
px = 500;   % 1) define the number of points that we want to sample
            % in one unit length for our waveform. In image, 
            % this is referred as pixels.
py = 700; 
l =  1      % 2) we define the length of x and y 1 which is also the unit 
            % length of our input.
dx = l/px; % rate of change in x
dy = l/py; % rate of change in y
            
fx=1; % wave frequency in x
wx = 2*pi*fx; % angular frequency x
fy=1; % wave frequency in y 
wy = 2*pi*fy; % wave frequency in x

I1=zeros(py,px); 
% 1 general programming
for i = 1:py
    y=(i-1)*dy;
    for ii = 1:px
        x=(ii-1)*dx;
        I1(i,ii) = sin((wx*x)/l+(wy*y)/l); % sinusoid equation in 2 dimension
    end
end

figure(2)
imshow(I1) 

% 2 Matlab
[X,Y] = meshgrid((0:l/px:l-1/px),(0:l/py:l-1/py)); %meshgrid replicates these 
I2 = sin((wx*X)/l+(wy*Y)/l);
figure(3);imshow(I2);


