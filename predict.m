addpath toolbox/;

load feats/test.mat;
load params.mat;

numCategories = 5; % Number of emotion categories

W = stack2param(theta, decodeInfo);
numCategories = numCategories;
numFeats = size(X, 2);

pred = exp(W{1}*X); % k by n matrix with all calcs needed
pred = bsxfun(@rdivide,pred,sum(pred));
[~, guessedCategories] = max(pred);

% Calculate scores
confusion = zeros(numCategories, numCategories);
for actual = 1:numCategories
    guessesForCategory = guessedCategories(Y == actual);
    for guessed = 1:numCategories
        confusion(actual, guessed) = sum(guessesForCategory == guessed);
    end
end

truePos = diag(confusion); % true positives, column vector
accuracy = sum(truePos) / numFeats;

disp(sprintf('Accuracy = %f%% (%d/%d)', accuracy * 100, sum(truePos), numFeats));
displayConfusionMatrix(confusion, 5);
