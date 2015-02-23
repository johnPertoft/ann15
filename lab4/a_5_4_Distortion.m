%% 5.3 Energy

close all;
clear;
pict; % Load data

% Weight matrix. Select units randomly
W = p1' * p1 + p2' * p2 + p3' * p3;

% Parameters
iters = 10;
sync = 1;
start = p3;

% Choose degraded image
N = size(p1, 2);
noiseRates = [0:N*0.01:N];

E = [];
I = [];

target = start;

for percent=1:1:100
    
    d = flip(start, floor(N*percent/100));
    
    for i=1:iters
        idx = randperm(1024);
        idx = idx(1); % Pick a random number between 1 and 1024
        
        if sync
            d = sgn(W * d')';
        else % async, seq
            d(idx) = sgn(sum(W(idx,:) .* d))';
        end
        
        e = - ((W * d')' * d'); % -sum over i sum over j wij * xi * xj
    end
    
    if sum(ismember(target, sgn(d), 'rows')) > 0
        successfull = 1;
    else
        successfull = 0;
    end
    
    E = [E successfull];
    I = [I percent];
    
    subplot(10, 10, percent);
    vis(d);
    axis off;
    
    %vis(d);
    %figure;
end

%vis(d);
%figure;

%plot(I, E, '*');
%xlabel('Noise rate');
%ylabel('Successfull restoration');