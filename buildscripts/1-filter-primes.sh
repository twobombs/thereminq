#/bin/bash
# transfer 200M primes into /var/log/sieve
#
mkdir /var/log/sieve
#
# this wil generate a load of ~150 for 5 mins
# this script will fork 200 prime list generators
# and place them in /log for filebeat to pick up
# don't do this on 24 cores or less with ssd
#
for i in {1..199}
    do
	echo $i
	cat 2T_part$i.txt | sed 's/\s\+/\n/g' > /var/log/sieve/primes${i}.txt &
    done
