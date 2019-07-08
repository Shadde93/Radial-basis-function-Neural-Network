close all

n = 5;
dim = 2; 
sigma = 0.5;
eta = 0.2;
epochs = 50;


data_train = load('ballist.dat');
training_x = data_train(:,1:2);
training = data_train(:,3:4);

N = length(training); % length of patterns

data_test = load('balltest.dat');
testing_x = data_test(:,1:2); % x-coordinates for testing
testing = data_test(:,3:4);

CL

result_train = PhiTraining*w;
result_test = PhiTesting*w;


if 1
    figure
    plot(result_train(:,1),result_train(:,2),'b*', training(:,1), training(:,2), 'r*', mu(:,1), mu(:,2), 'kO')
    legend('train','init data','node mu')
    title(strcat({'CL, RBF units = '},{num2str(n)},{', '},{'var = '},num2str(sigma),{', '},{'\eta = '},num2str(eta)))


end