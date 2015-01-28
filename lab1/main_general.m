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

%nList = (5:5:100);
errList = [];
eta = 0.01;
epochs = 500;
hidden = 10;
hList = (1:30);
n = 10;

[out, err] = backpropGeneral(patterns, targets, epochs, 100, eta, 10);
err
% for hIdx = 1:numel(hList)
% errSum = 0;
% iters = 30;
% hidden = hList(hIdx);
%     for i=1:iters
%         [out, err] = backpropGeneral(patterns, targets, epochs, hidden, eta, n);
%         errSum = errSum + err;
%     end
%     
%     errList = [errList, errSum / iters];
% end
%plot(hList, errList);