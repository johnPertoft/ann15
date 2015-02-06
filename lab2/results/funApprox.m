clear;

[xtrain, ytrain] = readxy('ballist', 2, 2);
[xtest, ytest] = readxy('balltest', 2, 2);

% Preprocessing of training input data
%xtrain = lowPassFilter(xtrain);
%xtest = lowPassFilter(xtest);
%plot(1:size(xtrain(:,1)), xtrain);

units = 20;
data = xtrain;
vqinit;
singlewinner = 0;
emiterb

% hold on
% plot(ytrain(:, 1), ytrain(:, 2), 'r+')
% hold off

Phi = calcPhi(xtrain, m, var);

d1 = ytrain(:,1);
d2 = ytrain(:,2);
dtest1 = ytest(:,1);
dtest2 = ytest(:,2);

% Weight vectors
w1 = Phi\d1;
w2 = Phi\d2;

% Function approximation using the weigh vectors, training data
y1 = Phi*w1;
y2 = Phi*w2;

% Function approximation using the weigh vectors, test data
Phitest = calcPhi(xtest, m, var);
ytest1 = Phitest * w1;
ytest2 = Phitest * w2;units = 20;

figure;

subplot(2,2,1), xyplot(d1, y1, 'train1');
subplot(2,2,2), xyplot(d2, y2, 'train2');
subplot(2,2,3), xyplot(dtest1, ytest1, 'test1');
subplot(2,2,4), xyplot(dtest2, ytest2, 'test2');