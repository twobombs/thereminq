for i in {4096..65535}
    do echo $i | matho-primes -c 1 -u $1 | ./shors_factoring $(($1*$i)) | grep "Found"
done
