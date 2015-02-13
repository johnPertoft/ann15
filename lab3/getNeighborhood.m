function points = getNeighborhood(row, col, dist, coldim, rowdim)

points = [];

for r=max(1, row-dist):min(rowdim, row+dist)
    for c=max(1, col-dist):min(coldim, col+dist)
        manhattanDist = abs(col-c) + abs(row-r);
        if (manhattanDist <= dist && ~(r == row && c == col))
            points = [r c manhattanDist; points];
        end
    end
end

end

