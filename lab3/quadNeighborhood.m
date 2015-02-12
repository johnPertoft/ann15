function [nbSize] = linearNeighborhood(i, maxNB, maxEpochs)
    for j=1:
    nbSize = round(maxNB*exp(-square(j-1)));
end

