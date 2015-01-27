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

n = 25;
eta = 0.01;
epochs = 5000;
hidden = 2;

backpropGeneral(patterns, targets, epochs, hidden, eta, n);