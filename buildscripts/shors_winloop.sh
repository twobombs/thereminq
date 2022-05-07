for i in {1..55108}
    do
	for j in {1..10}
	do
	prime=$(matho-primes -c 1 -u $i)
	echo $(($prime * $prime)) > i2
	i2=$(<i2)
	prime2=$(matho-primes -c 1 -u $i2)
	echo $(($prime * $prime2)) > fact
	fact=$(<fact)
	echo $fact | ./shors_factoring $1 > factoring
	cat factoring | grep Found
	cat factoring | grep Failed
	cat factoring | grep 'non- relative prime'
	echo 'Prime #1:   ' $prime 'Prime #2:   ' $prime2 'Multiplied: ' $fact
	echo ' '
    done
done
