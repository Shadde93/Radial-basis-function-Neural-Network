strtrain = strcat({'Training:'},{num2str(n)},{' '},{'RBF units,'},{' '},{'sigma='},num2str(sigma));
strtest = strcat({'Testing:'},{num2str(n)},{' '},{'RBF units,'},{' '},{'sigma='},num2str(sigma));
%    end
% figure
% hold on
% plot(result_train(:,1),result_train(:,2),'b*')
% plot(training(:,1),training(:,2),'r*')
% plot(mu(:,1),mu(:,2),'m*')
% axis([0 1 0 1])
% legend('training','real values','RBF units')
% title(strtrain)
% disp(strcat('Residual error training=',num2str(areTraining)))
% 
% figure    
% hold on
% plot(result_test(:,1),result_test(:,2),'b*')
% plot(testing(:,1),testing(:,2),'r*')
% plot(mu(:,1),mu(:,2),'m*')
% axis([0 1 0 1])
% legend('testing','real values','RBF units')
% title(strtest)
% disp(strcat('Residual error test=',num2str(areTesting)))
% disp(strcat('Epochs=',num2str(epochs)));

figure
hold on
plot(training(:,1),training(:,2),'r*', mu(:,1), mu(:,2), 'kO')
title('Train');
%axis([0 1 0 1])

figure
plot(result_train(:,1),result_train(:,2),'b*', mu(:,1), mu(:,2), 'kO')
title('Train result');
%axis([0 1 0 1])

figure
hold on
plot(testing(:,1),testing(:,2),'r*', mu(:,1), mu(:,2), 'kO')
%axis([0 1 0 1])
title('Test');

figure
plot(result_test(:,1),result_test(:,2),'b*', mu(:,1), mu(:,2), 'kO')
title('Test result');
%axis([0 1 0 1])


% displays the mean absolute error
disp(strcat('Residual error training=',num2str(areTraining)))
disp(strcat('Residual error test=',num2str(areTesting)))

%     figure
%     plot(errorTr)
%     title('Error training')
%     figure
%     plot(errorTe)
%     title('Error testing')
