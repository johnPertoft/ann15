function [theta] = neighborhoodGaussian(u, v, epoch, maxEpochs, numNodes)

% Cyclic distance measurement
dist = min(abs(u-v), numNodes-abs(u-v));

theta = exp(-(dist^2 / (1/((0.01*epoch)^2))));

end

