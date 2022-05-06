# shors factoring experimental fail test
# none of the values should produce a hit
# this scripts feeds shors' prime numbers
# used for opencl stack and sanity testing

for i in {1000..10000}
    do echo $i | matho-primes -c 1 -u $1 | ./shors_factoring $1 | grep "Found"
done
