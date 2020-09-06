docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/1,target=/var/log/qrack twobombs/qracknet:cosmos-gpu1
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/2,target=/var/log/qrack twobombs/qracknet:cosmos-gpu2
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/3,target=/var/log/qrack twobombs/qracknet:cosmos-gpu1
docker run --gpus all --device=/dev/dri:/dev/dri -d --mount type=bind,source=/var/log/qrack/4,target=/var/log/qrack twobombs/qracknet:cosmos-gpu2
