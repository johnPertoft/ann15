clear;

patterns = eye(8) * 2 - 1;
targets = patterns;

eta = 0.001;
epochs = 5000;
hidden = 10;

backprop(patterns, targets, epochs, hidden, eta);