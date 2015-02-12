clear;

% generate the animal data
animals
numAnimals = 32;

epochs = 40;
eta = 0.2;

W = randn(100, 84);
maxNeighborhood = 50;
neighborhood = maxNeighborhood;

for i=1:epochs
    for j=1:numAnimals
        p = props(j, :);
        [minDist, rowIndex] = euclideanDistance(W, p);
        
        % update winner
        W(rowIndex, :) = W(rowIndex, :) + eta .* (p - W(rowIndex, :));
        
        % update neighborhood
        for k=1:neighborhood
            up = rowIndex - k;
            down = rowIndex + k;
            
            if up >= 1
                W(up, :) = W(up, :) + eta * (p - W(up, :));
            end
            
            if down <= size(W, 1)
                W(down, :) = W(down, :) + eta * (p - W(down, :));
            end
        end
    end
    
    neighborhood = linearNeighborhood(i, maxNeighborhood, epochs)
end

pos = [];
for a=1:numAnimals
    p = props(a, :);
    [minDist, rowIndex] = euclideanDistance(W, p);
    pos = [pos rowIndex];
end

[dummy, order] = sort(pos);
snames(order)'