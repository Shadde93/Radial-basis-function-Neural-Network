close all

PhiTraining = zeros(length(training),n);
PhiTesting = zeros(length(testing),n);

mu = zeros(n,dim);

for i = 1:dim
    mu(:,i) = rand(n,1)*(max(training_x(:,i))-min(training_x(:,i))) + min(training_x(:,i));
end

errorTr = zeros(1,epochs);
errorTe = zeros(1,epochs);
for j = 1:epochs
    perm = randperm(N)';
    training_xPerm = training_x(perm);
    training_xPerm = repmat(training_xPerm,1,dim);
    trainingPerm = training(perm);
    trainingPerm = repmat(trainingPerm,1,dim);
    
    for k = 1:N
        dist_sq = sum((repmat(training_x(k,:),n,1)-mu).^2,2);
        [min_dist,index] = min(dist_sq);
        mu(index,:) = mu(index,:) + eta*(training_x(k,:) - mu(index,:));
        
    end
    
    
%    plot(mu,zeros(length(mu)),'m*')
%      axis([0 2*pi -1.5 1.5])
%      drawnow

%     for i = 1:n
%         PhiTraining(:,i) = exp(-(training_x-mu(i)).^2/(2*sigma^2));
%         %PhiTraining(i,:)=gauss(training_x(i,:),mu,var)';
%     end
% 
%     for i = 1:n
%         PhiTesting(:,i) = exp(-(testing_x-mu(i)).^2/(2*sigma^2));
%     end
% 
%     wr = PhiTraining\training;
%     
%     errorTr(j) = sum(abs(PhiTraining*wr-training))/N; 
%     errorTe(j) = sum(abs(PhiTesting*wr-testing))/length(testing);
    
    
end

for i = 1:n
    dist_sq = sum((training_x-repmat(mu(i,:),N,1)).^2,2);
    PhiTraining(:,i) = exp(-dist_sq/(2*sigma^2));
    %PhiTraining(i,:)=gauss(training_x(i,:),mu,var)';
end

for i = 1:n
    dist_sq = sum((testing_x-repmat(mu(i,:),N,1)).^2,2);
    PhiTesting(:,i) = exp(-dist_sq/(2*sigma^2));
end

w = PhiTraining\training;

% w = zeros(n,1); %rand(n,1)+0.1; % initialize weights as zeros or randomly, zero seems to work better
% epochs = 1000;
% for j = 1:epochs
%     perm = randperm(N);
%     training_xPerm = training_x(perm);
%     training_xPerm = repmat(training_xPerm,1,dim);
%     for k = 1:N
%         Phi_vec = exp(-(training_xPerm(k) - mu).^2/(2*sigma^2));% vector Phi (10) in lab description
%         err = trainingPerm(k) - Phi_vec'*w; % f-f_hat
%         w = w+eta*err(1)*Phi_vec;
%     end
% end


areTraining = sum(sqrt(sum((PhiTraining*w-training).^2,2)))/N; 
areTesting = sum(sqrt(sum((PhiTesting*w-testing).^2,2)))/length(testing);

