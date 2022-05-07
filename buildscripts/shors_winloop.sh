for i in {16..55108}
    do prime=$(matho-primes -c 1 -u $i) && echo $(($prime * 128)) | ./shors_factoring $1 | grep "Found"
done
