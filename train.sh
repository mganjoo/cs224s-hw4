#!/bin/bash

# Class: CS224S
# Assignment: HW4
# Author: Frank Liu
#
# Trains a basic classifier using LIBLINEAR. Run 'bash extract_feat.sh 1' first.
# CS224S students - modify this file to suit your implementation

# output of openSMILE is already in LIBLINEAR/LIBSVM data file format!
# format the data
python classifier/format_data.py

# train the classifier
./classifier/train -s 6 -c 0.09 feats/train_formatted.lsvm emotion.model
