#!/bin/bash

apt update && apt install -y p7zip

mkdir primes
cd primes

for i in {1..200}
 do
  wget 'http://www.primos.mat.br/dados/2T_part'$i'.7z'
 done

p7zip -d *.7z

