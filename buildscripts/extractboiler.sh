#!/bin/bash
# measuring and gathering boiler results

for i in {4..32}

do
    cat t_cc_nn_boil$(($i))* | grep -v ',-1' | grep -v ',0' | grep -v 'Name' | tr , '\n' | grep -v test | grep -v Binary > /root/boiler$(($i))
    printf '%08X\n' $(< /root/boiler$(($i)) ) > /root/boiler$(($i)).hex

    echo -n $i' - '
    cat /root/boiler$(($i)).hex | grep 00000020 | wc -l
done
