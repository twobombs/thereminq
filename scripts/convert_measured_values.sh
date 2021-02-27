#!/bin/bash

# collect all qrack output log file and make one decimal file
cd /var/log/qrack

find . -type f -name '*.log' -exec cat {} + | grep test | tr , '\n' | grep 26 | grep -v test | grep -v Binary > measured.decimals

# convert dec to hex values
printf '%08X\n' $(< measured.decimals)
