% Generalized delta rule
function [ output_args ] = backprop(patterns, targets, epochs, hidden, eta)
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

w = randn(hidden, insize + 1);
v = randn(outsize, hidden + 1);
X = [patterns ; ones(1,ndata)];

alpha = 0.9;
error = ones(epochs);
% temp
dw = 0;
dv = 0;

for epoch=1:epochs
    % forward pass
    hin = w * X;    
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    % backward pass
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    % weight update
    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    % see progress
    error(epoch) = sum(sum(abs(sign(out) - targets)./2));
    %disp(error(epoch));
end
    plot(error);
end

