#!/bin/bash
#author: Jay Mills 19/02/2015
#run as: 
#./convert_ui name_in name_out
pyuic4 -x $1.ui -o $2.py
