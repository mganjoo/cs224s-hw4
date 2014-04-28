addpath toolbox/;
addpath toolbox/minFunc/;

% Load feature file
load feats/train.mat;

numCategories = 5;  % 5 emotion categories

% Parameters
trainParams.lambda = 0.1;          % Regularization parameter
trainParams.f = @tanh;             % Function to use in the neural network activations
trainParams.f_prime = @tanh_prime; % Derivative of f

% Initialize actual weights
[ theta, decodeInfo ] = initializeParameters(size(X, 1), numCategories);
trainParams.decodeInfo = decodeInfo;

% minFunc options
options.Method = 'lbfgs';
options.display = 'off';
options.MaxIter = 500;    % Maximum number of iterations

data.feats = X;
data.categories = Y;
[theta, ~, ~, ~] = minFunc( @(p) softmaxCost(p, data, trainParams ), theta, options);

save('params.mat', 'theta', 'decodeInfo');
