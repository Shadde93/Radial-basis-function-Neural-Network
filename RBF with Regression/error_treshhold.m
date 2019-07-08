%% Batch
clear 
clc

x_tr1 = (0:0.1:2*pi)'; %The inputs
noise1 = normrnd(0,0.1,[length(x_tr1),1]);
x_tr = x_tr1 + noise1; %The inputs + noise

x_te1 = (0.05:0.1:2*pi)';
noise2 = normrnd(0,0.1,[length(x_te1),1]);
x_te = x_te1 + noise2;% test

%The target
f_tr = sin(2*x_tr1); 
f_te = sin(2*x_te1);

units = 70; %The number of RBF units

[m_tr, var]=fixrbf(units,x_tr);

Phi_tr = calcPhi(x_tr,m_tr,var);
Phi_te = calcPhi(x_te,m_tr,var);



for i = 1:units
    Phir = Phi_tr(:,(1:i));
    wr = Phir\f_tr;
    yr = Phir*wr;
    if mean(abs(yr - f_tr)) < 0.01
        Phi_te1 = Phi_te;
        Phi_te1(:,(i+1:end)) = [];
        yte = Phi_te1*wr;
        if mean(abs(yte - f_te)) < 0.01
            break
        end
    end 
end

y_tr = yr;
e_tr = mean(abs(y_tr - f_tr))

y_te = yte;
e_te = mean(abs(y_te - f_te))

% plot(x_tr,y_tr, '--r',x_te, y_te, 'g', x_tr1, f_tr, 'b')
% xlim([0 max(x_tr)])
% ylim([-1.5 1.5])
% legend('predictive','test', 'true')
% title(strcat({'Batch Learning, RBF units = '},{num2str(units)},{', '},{'var = '},num2str(var(1))))