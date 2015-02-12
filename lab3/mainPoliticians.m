clear;
initVotes;

epochs = 10;
eta = 0.2;

numNodes = 100;
numPoliticians = 349;
numVotes = 31;

W = randn(numNodes, numVotes);

%maxNeighborhood = 2;
%neighborhood = maxNeighborhood;

for i=1:epochs
    
    % Randomize the datapoint order to iterate over when updating the
    % weights
    datapoints = randperm(numPoliticians, numPoliticians);
    
    for j = datapoints
        p = votes(j, :); % Votes for politician j
        [minDist, rowIndex] = euclideanDistance(W, p);
        
        % update winner
        for l=1:size(W, 1)
            % eta = 1 / (i^(1/4)); Uncomment if eta is to change over the epochs
            
            % TODO 2 dimensional array, so change!
            W(l, :) = W(l, :) + neighborhoodGaussian(rowIndex, l, i, epochs, 100) .* eta .* (p - W(l, :));
        end
    end
    
%     tour = [W;W(1,:)];
%     plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');
%     title(num2str(neighborhood));
%     pause(0.1);
end

% Plot
[x,y] = meshgrid([1:10],[1:10]);
xpos = reshape(x,1,100);
ypos = reshape(y,1,100);

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



