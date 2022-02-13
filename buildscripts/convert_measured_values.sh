#!/bin/bash

# collect all qrack output log file and make one decimal file

find /var/log/qrack/. -type f -name '*.log' -exec cat {} + | grep test | grep ',24,' | grep -v ',24,0' | grep -v ',24,-1' | tr , '\n' | grep -v test | grep -v Binary > measured.dec

# convert dec to hex values
printf '%08X\n' $(< measured.dec)
