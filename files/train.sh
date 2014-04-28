#!/bin/bash

# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Trains a basic classifier using LIBLINEAR. Run 'bash extract_feat.sh 1' first.
# CS224S students - modify this file to suit your implementation

# output of openSMILE is already in LIBLINEAR/LIBSVM data file format!
# format the training data
python classifier/format_train_data.py

# train the classifier
./classifier/train feats/train_formatted.lsvm emotion.model
