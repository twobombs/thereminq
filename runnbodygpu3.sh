#
# example: when a controller image had docker enabled through a docker socket fs mount, the controller can call docker worker instances.
# in this example an IGP GPU instances are started to run, after completion a pause of 120 seconds sets in before starting again
#

docker pull twobombs/qracknet:cosmos-nbody-gpu3

docker rm nbodygpu3a

docker run --name nbodygpu3a --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-nbody-gpu3

docker logs --follow nbodygpu3a

sleep 120

# run again
./runnbodygpu3.sh
