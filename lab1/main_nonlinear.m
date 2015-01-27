clear;

x=[-5:1:5]';
y=x;
z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;

[gridsize, cols] = size(x);

ndata = gridsize * gridsize;

mesh (x, y, z);

targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

% Back prop
eta = 0.1;
epochs = 1000;
hidden = 10;

backpropGauss(patterns, targets, epochs, hidden, eta, x, y, gridsize);