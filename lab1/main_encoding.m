clear;

patterns = eye(8) * 2 - 1;
targets = patterns;

eta = 0.2;
epochs = 700;
hidden = 3; % Do not change

[out, hout] = backprop(patterns, targets, epochs, hidden, eta);

sign(hout(1:3,:))