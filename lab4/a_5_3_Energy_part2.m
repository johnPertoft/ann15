%% 5.3 Energy

clear;
pict; % Load data

% Weight matrix. Random values, normal distribution
N = size(p1, 2);
W = randn(N, N);
W = 0.5 * (W + W');
W = W - diag(diag(W));

% Parameters
iters = 10000;
sync = 0;

% Create random distorted image
d = (rand(1, N) .* 2) - 1;
vis(sgn(d));

figure;

E = [];
I = [];

E = [E (-((W * d')' * d'))]
I = [I 0]

for i=1:iters
   idx = randperm(1024); 
   idx = idx(1); % Pick a random number between 1 and 1024
   
   if sync
    d = sgn(W * d')';
   else % async, seq
    d(idx) = sgn(sum(W(idx,:) .* d))';
   end
   
   e = - ((W * d')' * d'); % -sum over i sum over j wij * xi * xj
   
   E = [E e];
   I = [I i];

% %    if mod(i, 100) == 0
%         vis(d);
%         %waitforbuttonpress; 
%    end
end

vis(d);

figure;

plot(I, E);
xlabel('Iterations');
ylabel('Energy');

E(size(E, 2))