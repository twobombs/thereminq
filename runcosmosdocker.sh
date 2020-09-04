docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-gpu1
sleep 10
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-gpu2
sleep 10
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-gpu1
sleep 10
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack,target=/var/log/qrack twobombs/qracknet:cosmos-gpu2
