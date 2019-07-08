% Calculate responses for gaussian RBF units from sample vector x
function Phi = calcPhi(x,m,var)

%Dimension the function matrix fi
Phi = zeros(length(x),length(m));

function gauss = gauss(x,m,var)
% GAUSS(X,M,VAR) is a gaussian in one dimension
% X	is the positions, each row is one coordinate
% M 	is centers for the bell shaped gaussians
% VAR 	is their variances
gauss=exp(-((m-x).^2)./(2*(var)));
end

%Calculate the RBF responses
for i=1:length(x)
  Phi(i,:) = gauss(x(i,:),m,var)';
end

end

