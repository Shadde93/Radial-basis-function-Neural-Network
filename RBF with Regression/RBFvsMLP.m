% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 11-Feb-2018 13:30:22
%
% This script assumes these variables are defined:
%
%   training_x - input data.
%   training - target data.

close all

fun = @(x) sin(2*x);
%fun = @(x) square(2*x);

tx = [0:0.01:2*pi]'; % for creating the target
targets = fun(tx);

sigma_noise = 0.1;

training_x_real = [0:0.1:2*pi]'; % x-coordinates for training
N = length(training_x_real);% length of patterns
training_x = training_x_real + normrnd(0,sigma_noise,[N 1]);
training = fun(training_x_real); % the patterns
training_real = training;

testing_x_real = [0.05:0.1:2*pi]'; % x-coordinates for testing
testing_x = testing_x_real + normrnd(0,sigma_noise,[N 1]);
testing = fun(testing_x_real);
testing_real = testing;

x = training_x';
t = training';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
hiddenLayerSize = [5 5];
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 50/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 30/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y)

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)

figure
plot(training_x',y)
hold on
plot(tx,targets)
