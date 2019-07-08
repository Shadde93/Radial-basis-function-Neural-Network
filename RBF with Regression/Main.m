%% Batch. Test how many nodes are required to get below the treshold
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

T = 8; %The number of RBF units
for units = 1:T
    [m_tr, var]=fixrbf(units,x_tr);

    Phi_tr = calcPhi(x_tr,m_tr,var);
    Phi_te = calcPhi(x_te,m_tr,var);

    w_tr = Phi_tr\f_tr;
    y_tr = Phi_tr*w_tr;
    y_te = Phi_te*w_tr;

    e_tr = mean(abs(y_tr - f_tr));

    e_te = mean(abs(y_te - f_te).^2);
    %if e_tr < 0.001
    %    break
    %end
 
end


e_te
e_tr

plot(x_tr,y_tr,'--r',x_te, y_te, 'g', x_tr, f_tr, 'b')
xlim([0 max(x_tr)])
ylim([-1.5 1.5])
legend('predictive','test', 'true')
title(strcat({'Batch, RBF units = '},{num2str(units)},{', '},{'var = '},num2str(var(1))))


%% delta
clear 
clc

x_tr1 = (0:0.1:2*pi)'; %The inputs
noise1 = normrnd(0,0.1,[length(x_tr1),1]);
x_tr = x_tr1 + noise1; %The inputs + noise

x_te1 = (0.05:0.1:2*pi)';
noise2 = normrnd(0,0.1,[length(x_te1),1]);
x_te = x_te1 + noise2;% test

%The target
f_tr = sin(2*x_tr); 
f_te = sin(2*x_te);
%f_tr = square(2*x_tr); 
%f_te = square(2*x_te);

units = 16; %The number of RBF units
eta = 0.1;

[m_tr, var, w_tr]=fixrbf(units,x_tr);

var = 0.5;

Phi_tr = calcPhi(x_tr,m_tr,var);
Phi_te = calcPhi(x_te,m_tr,var);

k = size(x_tr,1);
%Phi_k = zeros(length(m_tr),1);
x_tr_rn = x_tr(randperm(k)); %random shuffle the data

for i = 1:k
    xr = x_tr_rn(i);
    for h = 1: length(m_tr)
        Phi_k= exp(-((m_tr-xr).^2)./(2*(var)));
    end 
    ry = Phi_k'*w_tr;
    err = sin(2*xr)-ry;
    w_tr = w_tr+eta*err*Phi_k;
end
    
y_tr = Phi_tr*w_tr;
res_error_tr = mean(abs(y_tr - f_tr))

y_te = Phi_te*w_tr;
res_error_te = mean(abs(y_te - f_te));

plot(x_tr,y_tr,'--r',x_te, y_te, 'g', x_tr, f_tr, 'b')
xlim([0 max(x_tr)])
ylim([-1.5 1.5])
legend('predictive','test', 'true')
title(strcat({'Incremental Learning (delta), RBF units = '},{num2str(units)},{', '},{'var = '},num2str(var(1)),{', '},{'\eta = '},num2str(eta)))
