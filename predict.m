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
results.confusion = confusion;
results.accuracy = sum(truePos) / numFeats;
t = truePos ./ sum(confusion, 2);
results.avgPrecision = mean(t(isfinite(t), :));
t = truePos' ./ sum(confusion, 1);
results.avgRecall = mean(t(:, isfinite(t)));

accstr = sprintf('Accuracy = %f%% (%d/%d)', results.accuracy * 100, sum(truePos), numFeats);
disp(accstr);
displayConfusionMatrix(confusion, 5);
