# build qracknet image and its required services

# docker build --no-cache -t twobombs/qracknet:latest ./

cd .. 

docker build -t twobombs/qracknet:latest ./

docker build -t twobombs/qracknet:controller -f ./Dockerfile-controller .
docker build -t twobombs/qracknet:cpu -f ./Dockerfile-cpu .

docker build -t twobombs/qracknet:cosmos-cpu -f ./Dockerfile-cosmos-cpu .
docker build -t twobombs/qracknet:cosmos-gpu1 -f ./Dockerfile-cosmos-gpu1 .
docker build -t twobombs/qracknet:cosmos-gpu2 -f ./Dockerfile-cosmos-gpu2 .
docker build -t twobombs/qracknet:cosmos-multi -f ./Dockerfile-cosmos-multi .

docker build -t twobombs/qracknet:cosmos-nbody-cpu -f ./Dockerfile-cosmos-nbody-cpu .
docker build -t twobombs/qracknet:cosmos-nbody-gpu1 -f ./Dockerfile-cosmos-nbody-gpu1 .
docker build -t twobombs/qracknet:cosmos-nbody-gpu2 -f ./Dockerfile-cosmos-nbody-gpu2 .
docker build -t twobombs/qracknet:cosmos-nbody-multi -f ./Dockerfile-cosmos-nbody-multi .

docker build -t twobombs/qracknet:qft-cpu -f ./Dockerfile-qft-cpu .
docker build -t twobombs/qracknet:qft-gpu1 -f ./Dockerfile-qft-gpu1 .
docker build -t twobombs/qracknet:qft-gpu2 -f ./Dockerfile-qft-gpu2 .
docker build -t twobombs/qracknet:qft-multi -f ./Dockerfile-qft-multi .

docker build -t twobombs/qracknet:supreme-cpu -f ./Dockerfile-supreme-cpu .
docker build -t twobombs/qracknet:supreme-gpu1 -f ./Dockerfile-supreme-gpu1 .
docker build -t twobombs/qracknet:supreme-gpu2 -f ./Dockerfile-supreme-gpu2 .
docker build -t twobombs/qracknet:supreme-multi -f ./Dockerfile-supreme-multi .

docker build -t twobombs/qracknet:unittest -f ./Dockerfile-unittest .
docker build -t twobombs/qracknet:dummyload -f ./Dockerfile-dummyload .
docker build -t twobombs/qracknet:bonsai -f ./Dockerfile-Bonsai .
docker build -t twobombs/qracknet:tipsydev -f ./Dockerfile-tipsydev .
