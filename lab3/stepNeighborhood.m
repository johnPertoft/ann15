function [nbSize] = stepNeighborhood(i, maxNB, maxEpochs)
    if i < 2*maxEpochs/3
        nbSize = maxNB;
    elseif i > maxEpochs/3
        nbSize = maxNB-1;        
    else
        nbSize = maxNB-2;
    end
end

