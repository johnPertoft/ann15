clear;
initVotes;

epochs = 100;
eta = 0.2;

outputwidth = 10;
outputheight = 10;
numNodes = outputwidth * outputheight;
numPoliticians = 349;
numVotes = 31;
maxDist = 3;
dist = maxDist;
W = randn(numNodes, numVotes);

% Vector index to grid position mapping
[x,y] = meshgrid([1:10],[1:10]);
xpos = reshape(x,1,100);
ypos = reshape(y,1,100);

% Grid position to vector index mapping
xyToVecIdx = zeros(10,10);
for i=1:100
       x = xpos(i);
       y = ypos(i);
       xyToVecIdx(x,y) = i;
end

for i=1:epochs
    
    % Randomize the datapoint order to iterate over when updating the
    % weights
    datapoints = randperm(numPoliticians, numPoliticians);
    
    for j = datapoints
        p = votes(j, :); % Votes for politician j
        [minDist, rowIndex] = euclideanDistance(W, p);
        
        % update winner
        W(rowIndex, :) = W(rowIndex, :) + eta .* (p - W(rowIndex, :));
        
        col = xpos(rowIndex);
        row = ypos(rowIndex);
        
        % Update the neighbors
        neighbors = getNeighborhood(row, col, floor(dist), outputwidth, outputheight);
        
        for n=1:size(neighbors, 1)
           position = neighbors(n,:);
           idx = xyToVecIdx(position(2), position(1));
           
           W(idx, :) = W(idx, :) + (0.5/position(3)) * eta .* (p - W(idx, :));
        end
    end
    
    % Update neighborhood
    dist = linearNeighborhood(i, maxDist, epochs);
end

pos = [];
for i=1:numPoliticians
    p = votes(i, :); % Votes for politician i
    [minDist, rowIndex] = euclideanDistance(W, p);
    pos = [pos; rowIndex];
end

a = ones(1, 100) * 350;
a(pos) = 1:349

initMpparty;
p = [mpparty; 0];
image(p(reshape(a,10,10))+1);

% initMpsex;
% p = [mpsex; 0];
% image(p(reshape(a,10,10))+1);

% initMpdistrict;
% p = [mpdistrict; 0];
% image(p(reshape(a,10,10))+1);

