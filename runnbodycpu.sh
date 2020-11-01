#
# example: when a controller image had docker enabled through a docker socket fs mount, the controller can call docker worker instances.
# in this example 2 CPU instances are started and re-invoked until the system is fully stuffed 
#

docker pull twobombs/qracknet:cosmos-nbody-cpu

docker run -d --mount type=bind,source=/var/log/qrack/,target=/var/log/qrack --mount type=bind,source=/root/.qrack/,target=/root/.qrack twobombs/qracknet:cosmos-nbody-cpu
sleep 1
docker run -d --mount type=bind,source=/var/log/qrack/,target=/var/log/qrack --mount type=bind,source=/root/.qrack/,target=/root/.qrack twobombs/qracknet:cosmos-nbody-cpu

# run again
./runnbodycpu.sh
