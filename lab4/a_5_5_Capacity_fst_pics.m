%% 5.5 Capacity
% Around 60 patterns can be stored

close all;
clear;
pict; % Load data
pictures = [p1; p2; p3]
randPictures= [p4; p5; p6; p7; p8; p9];
randomPictureIndices = randperm(size(randPictures, 1));

% Parameters
start = p3;
iters = 10;
N = size(p1, 2);
randnumPictures = 0;

W = p1'*p1+p2'*p2+p3'*p3;
for p=1:randnumPictures
   W = W + (randPictures(randomPictureIndices(p), :)' * randPictures(randomPictureIndices(p), :));
end

d = start;

for i=1:iters            
    d = sgn(W * d')';
end

vis(d);
