clear;
close all;

rho = 0.3;

X =  [
    1 2 3;
    4 15 6;
    7 8 9
    ];

W = (X' - rho) * (X - rho)



for i=1:size(W, 1)
    for j=1:size(W, 1)
        sum = 0;
        for p=1:size(X, 1)
            sum = sum + ((X(p,i) - rho) * (X(p,j) - rho));
        end
        W(i,j) = sum;
    end
end

W