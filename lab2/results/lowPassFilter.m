function smooth = lowPassFilter( x )

smooth = [];
[entries,cols] = size(x(:,1));
tiny = 1 - (1 / entries);

smooth(1,1) = x(1,1);
smooth(1,2) = x(1,2);

for i=1:entries-1
    smooth(i+1,1) = tiny*x(i+1,1) + (1.0-tiny)*smooth(i,1);
    smooth(i+1,2) = tiny*x(i+1,2) + (1.0-tiny)*smooth(i,2);
end

end

