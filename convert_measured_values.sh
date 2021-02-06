#!/bin/bash

# collect all qrack output log file and make one file
cd /var/log/qrack
find . -type f -name '*.log' -exec cat {} +  > measured.file

# filter header legenda
cat measured.file | grep test > measured.values

# replace comma with enter
cat measured.values | tr , '\n' > measured.lines

# remove test name, now only decimal values are in the list
cat measured.lines | grep -v test > measured.decimals

# convert dec to hex values
printf '%08X\n' $(< measured.decimals)
