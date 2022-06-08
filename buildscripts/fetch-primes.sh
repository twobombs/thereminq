#!/bin/bash
# this little puppy will fetch the compressed dataset of the first 2 Billion primes and convert it for Elastic/Qimcifa consumption.
# It will eat 30Gb. it's called BigData for a reason and we've not even arrived at BigINT yet ( max here is 36 bits )  
#
apt update && apt install -y p7zip

mkdir primes
cd primes

for i in {1..200}
 do
  wget 'http://www.primos.mat.br/dados/De_900G_a_1T_part'$i'.7z'
 done

p7zip -d *.7z

