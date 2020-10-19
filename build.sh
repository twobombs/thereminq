# build qracknet image and its required services

docker build -t twobombs/qracknet:latest ./

docker build -t twobombs/qracknet:controller ./Dockerfile-controller
docker build -t twobombs/qracknet:cpu ./Dockerfile-cpu

docker build -t twobombs/qracknet:cosmos-cpu ./Dockerfile-cosmos-cpu
docker build -t twobombs/qracknet:cosmos-gpu1 ./Dockerfile-cosmos-gpu1
Docker build -t twobombs/qracknet:cosmos-gpu2 ./Dockerfile-cosmos-gpu2
docker build -t twobombs/qracknet:cosmos-gpu3 ./Dockerfile-cosmos-gpu3

docker build -t twobombs/qracknet:qft-cpu ./Dockerfile-qft-cpu
docker build -t twobombs/qracknet:qft-gpu1 ./Dockerfile-qft-gpu1
Docker build -t twobombs/qracknet:qft-gpu2 ./Dockerfile-qft-gpu2
docker build -t twobombs/qracknet:qft-gpu3 ./Dockerfile-qft-gpu3

docker build -t twobombs/qracknet:supreme-cpu ./Dockerfile-supreme-cpu
docker build -t twobombs/qracknet:supreme-gpu1 ./Dockerfile-supreme-gpu1
Docker build -t twobombs/qracknet:supreme-gpu2 ./Dockerfile-supreme-gpu2
docker build -t twobombs/qracknet:supreme-gpu3 ./Dockerfile-supreme-gpu3

docker build -t twobombs/qracknet:dummyload ./Dockerfile-dummyload
