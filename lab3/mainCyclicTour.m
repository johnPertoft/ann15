clear;

cities;
epochs = 500;
numCities = 10;
eta = 0.2;
numNodes = 20;
W = randn(numNodes, 2);
maxNeighborhood = 2;
neighborhood = maxNeighborhood;

for i=1:epochs
    
    % Randomize the datapoint order to iterate over when updating the
    % weights
    datapoints = randperm(numCities,numCities);
    
    for j = datapoints
        p = city(j, :);
        [minDist, rowIndex] = euclideanDistance(W, p);
        
        % update winner
        for l=1:size(W, 1)
            % eta = 1 / (i^(1/4)); Uncomment if eta is to change over the epochs
            W(l, :) = W(l, :) + neighborhoodGaussian(rowIndex, l, i, epochs, numNodes) .* eta .* (p - W(l, :));
        end
    end
    
    tour = [W;W(1,:)];
    plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');
    title(num2str(neighborhood));
    pause(0.1);
    
end

tour = [W;W(1,:)];
plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');