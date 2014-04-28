# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Formats the training and test data for use in the classifier.

from sklearn import preprocessing
import numpy as np
import scipy.io

# open the feature file
f_handle = open('feats/train.lsvm', 'r')
lines = f_handle.readlines()
f_handle.close()

# rewrite the features to the same file (overwrite)
f = open('feats/train_formatted.lsvm', 'w')

cols = len(lines[0].split()[1:])
rows = len(lines)

X = np.zeros((rows, cols))

for i, line in enumerate(lines):
    for j, x in enumerate(line.split()[1:]):
        X[i][j] = float(x.split(":")[1])

scaler = preprocessing.StandardScaler().fit(X)

X_trans = scaler.transform(X)
Y = np.zeros(rows)

for i, line in enumerate(lines):
    if i <= 105:  # anger
        label = 1
    elif i <= 262:  # despair
        label = 2
    elif i <= 408:  # happiness
        label = 3
    elif i <= 463:  # neutral
        label = 4
    else:
        label = 5
    Y[i] = label
    f.write(str(label) + " " +
            " ".join([str(j+1) + ":" + str(x)
                      for j, x in enumerate(X_trans[i])]) + "\n")
f.close()
scipy.io.savemat('feats/train.mat', {'X': np.transpose(X_trans), 'Y': Y},
                 oned_as='row')

# test data

# open the feature file
f_handle = open('feats/test.lsvm', 'r')
lines = f_handle.readlines()
f_handle.close()

# rewrite the features to the same file (overwrite)
f = open('feats/test_formatted.lsvm', 'w')

cols = len(lines[0].split()[1:])
rows = len(lines)

X = np.zeros((rows, cols))

for i, line in enumerate(lines):
    for j, x in enumerate(line.split()[1:]):
        X[i][j] = float(x.split(":")[1])

X_trans = scaler.transform(X)
Y = np.zeros(rows)

for i, line in enumerate(lines):
    if i <= 35:  # anger
        label = 1
    elif i <= 70:  # despair
        label = 2
    elif i <= 105:  # happiness
        label = 3
    elif i <= 130:  # neutral
        label = 4
    else:
        label = 5
    Y[i] = label
    f.write(str(label) + " " +
            " ".join([str(j+1) + ":" +
                      str(x) for j, x in enumerate(X_trans[i])]) + "\n")
f.close()
scipy.io.savemat('feats/test.mat', {'X': np.transpose(X_trans), 'Y': Y},
                 oned_as='row')
