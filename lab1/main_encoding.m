clear;

patterns = eye(8) * 2 - 1;
targets = patterns;

backprop(patterns, targets, 10000, 3);