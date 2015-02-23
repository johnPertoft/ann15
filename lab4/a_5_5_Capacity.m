%% 5.5 Capacity

close all;
clear;
pict; % Load data

% Weight matrix. Select units randomly
%W = p1' * p1 + p2' * p2 + p3' * p3 + p4' * p4;


% Parameters
iters = 10;
sync = 1;


% Choose degraded image
N = size(p1, 2);

E = [];
I = [];

% initial patterns
X = [];
W = zeros(1024, 1024);
for i=1:10
    pattern = sgn(randn(1, 1024));
    W = W + pattern' * pattern;
    X = [X; pattern];
end

successRatios = [];
patternSizes = [];

% For the number of patters 10 to 150
for numPatterns=10:3:150, numPatterns
    
    % add a new pattern
    pattern = sgn(randn(1, 1024));
    W = W + pattern' * pattern;
    X = [X; pattern];
    
    % find out how many registered patterns that can be restored
    numSuccessfull = 0;
    
    for p=1:size(X, 1)
        
        start = X(p, :);
        target = start;
        
        d = flip(start, floor(0.01 * 1024)); % flip 10% of the bits
        
        for i=1:iters
            
            idx = randperm(1024);
            idx = idx(1); % Pick a random number between 1 and 1024
            
            d = sgn(W * d')';
        end
        
        if sum(ismember(target, sgn(d), 'rows')) > 0
            numSuccessfull = numSuccessfull + 1;
        end
    end
    
    successRatios = [successRatios numSuccessfull/numPatterns];
    patternSizes = [patternSizes numPatterns];
    
end

plot(patternSizes, successRatios);
xlabel('Patter size');
ylabel('Success Rate');