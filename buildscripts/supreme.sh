#!/bin/bash
#
# we fetch the sycamore 28 qbit over 14 depth and extract it for filter-feed processing
wget https://datadryad.org/stash/downloads/file_stream/693522
tar -xvzf 693522 && cd n28_m14
data=$(cat measured_supreme_28q14d.txt); for byte in $data; do echo $(printf '%x\n' "$((2#$byte))"); done | xxd -r -p > measured_supreme_28q14d.dec
printf '%08X\n' $(<measured_supreme_28q14d.dec) > measured_supreme_28q14d.hex
