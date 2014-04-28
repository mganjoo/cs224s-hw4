#!/bin/bash

python classifier/format_data.py

module load matlab
matlab -nodesktop -nodisplay -r "run predict.m, exit"
module unload matlab
