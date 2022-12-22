#!/bin/bash
# measuring and gathering boiler results

for i in {4..32}

do
    cat t_cc_nn_boil$(($i))* | grep -v ',-1' | grep -v 'Name' > /root/boiler$(($i))
    echo -n $i' - '
    cat /root/boiler$(($i)) | wc -l
done

