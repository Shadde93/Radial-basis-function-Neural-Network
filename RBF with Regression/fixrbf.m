function [m, var, w]=fixrbf(units, x)
fmin = min(x);	% min for all dimensions
fmax = max(x);	% max for all dimensions

dist=((fmax-fmin)/(units-1));

%m is a column vector with positions (for several dimension => more columns)
m = (fmin:dist:fmax)';
%Initialize the weight vector with random values
w = rand(length(m),1);
% Let them also have the same standard deviation
sdev=m*0+0.5*dist;
%sdev = sum((x-mean(x)).^2)/length(x);?
var=sdev.*sdev;
