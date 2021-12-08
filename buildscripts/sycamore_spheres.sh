#!/bin/bash
# this script converts 2x90k of the s0e0 12q/28q-14d sycamore/qrack results
# and places those values in a tipsy bubble sphere graph 
# results of this calculation will be placed in the qracknet-graph repo
# 
# ==== here starts tipsy header declarations ======

# T = time
echo "0000000000000000" > time.hex
echo "00030000" > ndim.hex
echo "00000000" > nsph.hex
echo "00000000" > ndark.hex
echo "00010000" > version.hex

# ==== here end tipsy special declarations =========

# we fetch the sycamore 12 to 28 qbit over 14 depth results and extract it for filter-feed processing
#
tar -xvzf /thereminq/miscfiles/qrack-supreme12-28q14d10k.tar.gz ./ && cd qrack-supreme12-28q14d10k
#
