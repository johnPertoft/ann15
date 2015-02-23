%% 5.3 Energy

clear;
pict; % Load data

% Weight matrix. Select units randomly
W = p1' * p1 + p2' * p2 + p3' * p3;

% Parameters
iters = 5;
sync = 1;

% Choose degraded image
d = p11;
%d = p8;


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