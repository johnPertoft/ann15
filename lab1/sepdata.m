% returns normal distributed input data, classA in first 100 columns and
% classB in 101-200 columns
function [ pattern ] = sepdata( input_args )
classA(1,:) = randn(1,100) .* 0.5 + 1.0;
classA(2,:) = randn(1,100) .* 0.5 + 0.5;
classB(1,:) = randn(1,100) .* 0.5 - 1.0;
classB(2,:) = randn(1,100) .* 0.5 + 0.0;

pattern = [classA, classB];
end