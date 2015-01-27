% Generalized delta rule
function [ out ] = backpropGeneral(patterns, targets, epochs, hidden, eta, n)
[insize, ndata] = size(patterns);
outsize = size(targets, 1);

w = randn(hidden, insize + 1);
v = randn(outsize, hidden + 1);
X = [patterns(:,1:n) ; ones(1,n)];
X_full = [patterns ; ones(1,ndata)];
T = targets(1:n);

alpha = 0.9;
error = ones(epochs);

dw = 0;
dv = 0;

for epoch=1:epochs
    % forward pass
    hin = w * X;    
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,n)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    % backward pass
    delta_o = (out - T) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    % weight update
    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    % see progress - forward pass - Test with other data
    hin_approx = w * X_full;    
    hout_approx = [2 ./ (1+exp(-hin_approx)) - 1 ; ones(1,ndata)];
    oin_approx = v * hout_approx;
    out_approx = 2 ./ (1+exp(-oin_approx)) - 1;
    
    error(epoch) = sum(sum(abs(sign(out_approx) - targets)./2));
    disp(error(epoch));
end
    plot(error);
end

