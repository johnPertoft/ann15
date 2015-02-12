function [nbSize] = linearNeighborhood(i, maxNB, maxEpochs)
    nbSize = round(maxNB - i * (maxNB / maxEpochs));
end

