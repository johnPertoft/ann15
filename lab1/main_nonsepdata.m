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

backprop(patterns, targets, 100, 50)