clear;

% generate input
patterns = sepdata();

% generate targets
targets = ones(1, 200);
targets(:,101:200) = -1;

% permute order of input-target pairs
permute = randperm(200);
patterns = patterns(:, permute);
targets = targets(:, permute);

delta(patterns, targets, 50)