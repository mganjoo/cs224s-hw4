function [] = displayConfusionMatrix( confusion, numCategories )

disp('Confusion matrix:');
str = sprintf('%-7s', '...');
for i = 1:numCategories
    str = sprintf('%s%-7d', str, i);
end
str = sprintf('%s\n', str);
disp(str);
for i = 1:numCategories
    str = sprintf('%-7d', i);
    for j = 1:numCategories
        str = sprintf('%s%-7d', str, confusion(i, j));
    end
    str = sprintf('%s\n', str);
    disp(str);
end

end

