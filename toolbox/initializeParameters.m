% Initialize softmax neural network parameters.

function [ theta, decodeInfo ] = initializeParameters(inputSize, outputSize)

layers = [inputSize outputSize];
W = cell(length(layers)-1, 1);

r = sqrt(6) / sqrt(sum(layers));
for i = 1:(length(layers)-1)
    W{i} = rand(layers(i+1), layers(i)) * 2*r-r;
end

% Flatten
[theta, decodeInfo] = param2stack(W);

end
