clear;

patterns = eye(8) * 2 - 1;
targets = patterns;

eta = 0.1;
epochs = 1000;
hidden = 3; % Do not change

backprop(patterns, targets, epochs, hidden, eta);