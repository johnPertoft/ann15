clear;

x = (0:0.1:2*pi)'; % patterns
f = sin(2*x);

% RBF parameters

% units = 11;
% 
% makerbf
% 
% Phi = calcPhi(x, m, var);
% 
% w = Phi \ f;
% y = Phi * w;
% 
% rbfplot1(x, y, f, units)

unitsArr = (61:64);
err = [];

for units = unitsArr

makerbf

Phi = calcPhi(x, m, var);

w = Phi \ f;
y = Phi * w;

maxRes = rbfplot1(x, y, f, units);

err = [err, maxRes];

units
maxRes

end

plot(unitsArr, err);
xlabel('Number of units')
ylabel('Maximum residual value (absolute)')