% computes blah blah
function [ output_args ] = delta(patterns, targets, epochs)

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

%W = randn(
eta = 1.0; %????
X = [patterns; ones(1, ndata)];

for i=1:epochs
    deltaW = -eta * (WX - targets) * X';
    W = W + deltaW;
    
    
end

end

