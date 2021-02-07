#!/bin/bash

# collect all qrack output log file and make one decimal file
cd /var/log/qrack

find . -type f -name '*.log' -exec cat {} + | grep test | tr , '\n' | grep -v test > measured.decimals

# convert dec to hex values
printf '%08X\n' $(< measured.decimals)