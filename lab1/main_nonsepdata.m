clear;

% generate input
patterns = nonsepdata();

% generate targets
targets = ones(1, 200);
targets(:,101:200) = -1;

% permute order of input-target pairs
permute = randperm(200);
patterns = patterns(:, permute);
targets = targets(:, permute);

eta = 0.001;
epochs = 10000;
hidden = 10;

backprop(patterns, targets, epochs, hidden, eta)