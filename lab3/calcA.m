function a = calcA( pos, classification )

a = ones(1, 100);
for grid = 1:100
    %Store the classification (ie. party, gender, district) of each MP in
    %the specific grid
    politicians = find(pos==grid);
    pClasses = classification(politicians);
    % assign the most frequent to a(grid)
    maxClass = mode(pClasses);
    if isnan(maxClass)
         a(grid) = 350;
    else
        %find a politician of the most frequent class
    a(grid) = politicians(find(pClasses == maxClass,1));
    end
end    
 
end

