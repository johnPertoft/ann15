clear;

% generate the animal data
animals
numAnimals = 32;

epochs = 100;
eta = 0.2;
Wrows = 100;
W = randn(Wrows, 84);
maxNeighborhood = round(Wrows/2);
neighborhood = maxNeighborhood;

%scores = [];
%for epochs=1:40

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
    
    neighborhood = linearNeighborhood(i, maxNeighborhood, epochs);
end

pos = [];
for a=1:numAnimals
    p = props(a, :);
    [minDist, rowIndex] = euclideanDistance(W, p);
    pos = [pos rowIndex];
end

[dummy, order] = sort(pos);
animalOrder = snames(order)' %% remove semi colon to disp

score = 0;
for i=2:numAnimals
    a1 = nameMap(animalOrder{i-1});
    a2 = nameMap(animalOrder{i});
    
    score = score + sum(abs(props(a1, :) - props(a2, :)));
end
%scores = [scores score];
%end

%plot(scores);