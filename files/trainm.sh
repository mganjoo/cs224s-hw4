#!/bin/bash

python classifier/format_data.py

module load matlab
matlab -nodesktop -nodisplay -r "run train.m, exit"
module unload matlab
