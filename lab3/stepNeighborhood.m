function [nbSize] = stepNeighborhood(i, maxNB, maxEpochs)
    if i >= 0.5*maxEpochs
        nbSize = maxNB-2;
    elseif i >= 0.2*maxEpochs
        nbSize = maxNB-1;        
    else
        nbSize = maxNB;
    end
end

