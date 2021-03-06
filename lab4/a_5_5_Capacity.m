%% 5.5 Capacity
% Around 60 patterns can be stored

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
for numPatterns=size(X,1) + 1:1:170, numPatterns
    
    % add a new pattern
    pattern = sgn(randn(1, 1024));
    W = W + pattern' * pattern;
    
    Wscaled = W / N;
    
    X = [X; pattern];
    
    % find out how many registered patterns that can be restored
    numSuccessfull = 0;
    
    for p=1:size(X, 1)
        
        start = X(p, :);
        target = start;
        
        %d = flip(start, 20); % flip some of the bits
        d = start;
        
        for i=1:iters            
            d = sgn(Wscaled * d')';
        end
        
        if sum(ismember(target, sgn(d), 'rows')) > 0
            numSuccessfull = numSuccessfull + 1;
        end
    end
    
    successRatios = [successRatios (numSuccessfull/numPatterns)];
    patternSizes = [patternSizes numPatterns];
    
end

plot(patternSizes, successRatios, 0.138*N, 1, '*r');
xlabel('Patter size');
ylabel('Success Rate');