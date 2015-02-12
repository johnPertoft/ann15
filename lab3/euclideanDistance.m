function [minDist, rowIndex] = euclideanDistance(W, p)
    diffs = [];
    for row=1:size(W, 1)
        r = W(row, :);
        d = sqrt((p - r) * (p - r)');
        diffs = [diffs; d];
    end

    [minDist, rowIndex] = min(diffs);
end

