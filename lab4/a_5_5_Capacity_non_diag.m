%% 5.5 Capacity
% Around 60 patterns can be stored

close all;
clear;
pict; % Load data

% Parameters
iters = 5;
sync = 1;

% Choose degraded image
N = size(p1, 2);

E = [];
I = [];

% initial patterns
maxNumPatterns = 300;

% Create random patterns X
X = sign(randn(maxNumPatterns, 100));  % No bias
%X = sign(0.5 + randn(maxNumPatterns, 100));  % With bias

W = zeros(100, 100);

W = W + X(1, :)' * X(1, :); % Train with first patterns that was randomized earlier

successRatios = [];
patternSizes = [];

% For the number of patters 10 to maxNumPatterns
for numPatterns=2:1:maxNumPatterns, numPatterns
    
    % add a new pattern
    W = W + X(numPatterns, :)' * X(numPatterns, :);
    W = W - diag(diag(W));
    
    % find out how many registered patterns that can be restored
    numSuccessfull = 0;
    
    for p=1:numPatterns
        
        start = X(p, :);
        target = start;
        
        d = flip(start, 15); % flip some of the bits
        %d = start;
        
        for i=1:iters            
            d = sgn(W * d')';
        end
        
        %if sum(ismember(X(1:numPatterns, :), sgn(d), 'rows')) > 0
        if sum(ismember(target, sgn(d), 'rows')) > 0
            numSuccessfull = numSuccessfull + 1;
        end
    end
    
    successRatios = [successRatios (numSuccessfull/numPatterns)];
    patternSizes = [patternSizes numPatterns];
    
end

plot(patternSizes, successRatios, (0.138 * 100), 1, '*r');
xlabel('Pattern size');
ylabel('Success Rate');
axis([1 maxNumPatterns 0 1.1])