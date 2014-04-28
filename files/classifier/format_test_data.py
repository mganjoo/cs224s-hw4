# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Formats the test data for use in the classifier.


# open the feature file
f_handle = open('feats/test.lsvm', 'r')
lines = f_handle.readlines()
f_handle.close()

# rewrite the features to the same file (overwrite)
f = open('feats/test_formatted.lsvm', 'w')
for i, line in enumerate(lines):
    if i <= 35: # anger
        label = 1
    elif i <= 70: # despair
        label = 2
    elif i <= 105: # happiness
        label = 3
    elif i <= 130: # neutral
        label = 4
    else:
        label = 5
    f.write(str(label) + line[1:])

f.close()
