close all

n = 16;
dim = 1;
sigma = 0.5;
eta = 0.1;
epochs = 50;

fun = @(x) sin(2*x);

t = [0:0.01:2*pi]'; % for creating the target
targets = fun(t);


training_x = [0:0.1:2*pi]'; % x-coordinates for training
noise = normrnd(0,0.1,[length(training_x),1]);
training_x = training_x + noise;

training = fun(training_x); % the patterns
N = length(training); % length of patterns

testing_x = [0.05:0.1:2*pi]'; % x-coordinates for testing
noise1 = normrnd(0,0.1,[length(testing_x),1]);
testing_x = testing_x + noise1;
testing = fun(testing_x);

CL

train_resul = PhiTraining*w;

test_resul = PhiTesting*w;

if 1
    plotterCL1
end

