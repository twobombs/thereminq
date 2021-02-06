#!/bin/bash

# convert logfiles into ascii hex
./convert_measured_values.sh > measured.hex

# make ascii hex bin
xxd -r -p measured.hex measured.bin
