#!/bin/bash

# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Predicts the test set labels using the classifier.
# CS224S students - modify this file to suit your implementation

# predict using the trained classifier
./classifier/predict feats/test_formatted.lsvm emotion.model results.txt
