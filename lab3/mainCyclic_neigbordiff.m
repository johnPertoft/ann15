clear;

cities;
epochs =100;
numCities = 20;
eta = 0.2;
W = randn(40, 2);
worg = W;
maxNeighborhood = 2;
neighborhood = maxNeighborhood;
interval = 1:numCities;
city = abs(randn(20,2));

for maxNeighborhood=2:6
    W = worg;
    neighborhood = maxNeighborhood;
    for i=1:epochs
        
        for j=interval
            p = city(j, :);
            [minDist, rowIndex] = euclideanDistance(W, p);
            
            % update winner
            W(rowIndex, :) = W(rowIndex, :) + eta .* (p - W(rowIndex, :));
            
            % update neighborhood
            for k=1:neighborhood
                
                up = rowIndex - k;
                down = rowIndex + k;
                
                if up <= 0
                    up = size(W, 1) + up;
                end
                
                if down > size(W, 1)
                    down = down - size(W, 1);
                end
                
                W(up, :) = (W(up, :) + eta * (p - W(up, :)));
                W(down, :) = (W(down, :) + eta * (p - W(down, :)));
            end
            tour = [W;W(1,:)];
            plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');
            title(num2str(neighborhood));
            pause(0.01);
        end
        %neighborhood = stepNeighborhood(i, maxNeighborhood, epochs);
        neighborhood = linearNeighborhood(i, maxNeighborhood, epochs);
        %eta = eta*(1-1/epochs);
    end
    figure;
end
% tour = [W;W(1,:)];
% plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');