# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Formats the training data for use in the classifier.


# open the feature file
f_handle = open('feats/train.lsvm', 'r')
lines = f_handle.readlines()
f_handle.close()

# rewrite the features to the same file (overwrite)
f = open('feats/train_formatted.lsvm', 'w')
for i, line in enumerate(lines):
    if i <= 105: # anger
        label = 1
    elif i <= 262: # despair
        label = 2
    elif i <= 408: # happiness
        label = 3
    elif i <= 463: # neutral
        label = 4
    else:
        label = 5
    f.write(str(label) + line[1:])

f.close()
