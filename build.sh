# build qracknet image and its required services

docker build --no-cache -t twobombs/qracknet:latest ./

docker build -t twobombs/qracknet:controller -f ./Dockerfile-controller .
docker build -t twobombs/qracknet:cpu -f ./Dockerfile-cpu .

docker build -t twobombs/qracknet:cosmos-cpu -f ./Dockerfile-cosmos-cpu .
docker build -t twobombs/qracknet:cosmos-gpu1 -f ./Dockerfile-cosmos-gpu1 .
docker build -t twobombs/qracknet:cosmos-gpu2 -f ./Dockerfile-cosmos-gpu2 .
docker build -t twobombs/qracknet:cosmos-gpu3 -f ./Dockerfile-cosmos-gpu3 .

docker build -t twobombs/qracknet:qft-cpu -f ./Dockerfile-qft-cpu .
docker build -t twobombs/qracknet:qft-gpu1 -f ./Dockerfile-qft-gpu1 .
docker build -t twobombs/qracknet:qft-gpu2 -f ./Dockerfile-qft-gpu2 .
docker build -t twobombs/qracknet:qft-gpu3 -f ./Dockerfile-qft-gpu3 .

docker build -t twobombs/qracknet:supreme-cpu -f ./Dockerfile-supreme-cpu .
docker build -t twobombs/qracknet:supreme-gpu1 -f ./Dockerfile-supreme-gpu1 .
docker build -t twobombs/qracknet:supreme-gpu2 -f ./Dockerfile-supreme-gpu2 .
docker build -t twobombs/qracknet:supreme-gpu3 -f ./Dockerfile-supreme-gpu3 .

docker build -t twobombs/qracknet:dummyload -f ./Dockerfile-dummyload .
