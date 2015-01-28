% computes blah blah
function [ output_args ] = delta(patterns, targets, epochs)

[insize, ndata] = size(patterns)
[outsize, ndata] = size(targets)

W = randn(outsize, insize + 1);
eta = 0.001;
X = [patterns; ones(1, ndata)];
axis ([-2, 2, -2, 2], 'square');
for i=1:epochs
    deltaW = -eta * (W*X - targets) * X';
    W = W + deltaW;
    
    %%%%
    p = W(1,1:2);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');
    plot (patterns(1, find(targets>0)), ...
        patterns(2, find(targets>0)), '*', ...
        patterns(1, find(targets<0)), ...
        patterns(2, find(targets<0)), '+', ...
        [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
        [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    
    %pause(0.2);
    drawnow;
    %%%
end

end

