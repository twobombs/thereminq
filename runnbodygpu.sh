#
# example: when a controller image had docker enabled through a docker socket fs mount, the controller can call docker worker instances.
# in this example 4 GPU instances are started to run on a 2 GPU system, after completion a pause of 120 seconds sets in before starting again
#

docker pull twobombs/qracknet:cosmos-nbody-gpu1
docker pull twobombs/qracknet:cosmos-nbody-gpu2

docker rm nbodygpu1a
docker rm nbodygpu2a
docker rm nbodygpu1b
docker rm nbodygpu2b

docker run --name nbodygpu1a --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/1,target=/var/log/qrack twobombs/qracknet:cosmos-nbody-gpu1
docker run --name nbodygpu2a --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/2,target=/var/log/qrack twobombs/qracknet:cosmos-nbody-gpu2
docker run --name nbodygpu1b --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/3,target=/var/log/qrack twobombs/qracknet:cosmos-nbody-gpu1
docker run --name nbodygpu2b --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/4,target=/var/log/qrack twobombs/qracknet:cosmos-nbody-gpu2

docker logs --follow nbodygpu2b

sleep 5

# run again
./runcosmosdockergpu.sh
