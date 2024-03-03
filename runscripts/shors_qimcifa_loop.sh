#!/bin/bash
# qimcifa winloop 32 bits range with 16 bit steps
#
for i in {65535..4294967295..65535}
    do
	prime=$(matho-primes -c 1 -u $i)
	echo $(($prime + $prime)) > i2
	i2=$(<i2)
	prime2=$(matho-primes -c 1 -u $i2)
	echo $(($prime * $prime2)) > fact
	fact=$(<fact)
	echo $fact | ./qimcifa $1 1 1 0 > qimfact
	cat qimfact | grep 'Found'
	cat qimfact | grep 'elapsed'
	cat qimfact | grep 'Bits'
done
