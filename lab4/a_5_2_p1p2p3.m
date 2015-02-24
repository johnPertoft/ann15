%% 5.2 Sequential update
% p11 is completed in 1 iteration 
% p22 is never completed. More degraded as the number of iterations incease

clear;
pict; % Load data

% Weight matrix
W = p1' * p1 + p2' * p2 + p3' * p3;

% Parameters
iters = 100;

% Choose degraded image
d = p11;
%d = p22;

for i=1:iters
   d = sgn(W * d')'; 
   vis(d);
   waitforbuttonpress;
end