if 1
%     if batch == 0
%         strtrain = strcat({'Training:'},{num2str(n)},{' '},{'RBF units,'},{' '},{'sigma='},{num2str(sigma)},{', '},{'eta='},{num2str(eta)});
%         strtest = strcat({'Testing:'},{num2str(n)},{' '},{'RBF units,'},{' '},{'sigma='},{num2str(sigma)},{', '},{'eta='},{num2str(eta)});
%     elseif batch == 1
    plot(training_x, train_resul,'r--', t, targets, 'b',testing_x, test_resul, 'g', mu,zeros(length(mu)),'m*')
    axis([0 2*pi -1.5 1.5])
    legend('training','real values','test', 'RBF units')
    %if batch == 0
    disp(strcat('Residual error training=',num2str(areTraining)));
    disp(strcat('Residual error test=',num2str(areTesting)));
    %if batch == 0
    disp(strcat('Epochs=',num2str(epochs)));
    %end
    
%     figure
%     plot(errorTr)
%     title('Error training')
%     figure
%     plot(errorTe)
%     title('Error testing')
end