%% 5.2 Sequential update
% p11 is completed in 1 iteration 
% p22 is never completed. More degraded as the number of iterations incease

clear;
pict; % Load data

% Weight matrix. Select units randomly
W = p1' * p1 + p2' * p2 + p3' * p3;

% Parameters
iters = 100000;

% Choose degraded image
%d = p11;
d = p8;

for i=1:iters
   idx = randperm(1024); 
   idx = idx(1); % Pick a random number between 1 and 1024
   
   d(idx) = sgn(sum(W(idx,:) .* d))';
   
%    if mod(i, 100) == 0
%         vis(d);
%         %waitforbuttonpress; 
%    end
end

vis(d);