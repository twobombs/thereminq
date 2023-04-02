# build qracknet image and its required services

# docker build --no-cache -t twobombs/thereminq:latest ./

cd .. 

docker build -t twobombs/thereminq:latest ./

docker build -t twobombs/thereminq:controller -f ./Dockerfile-controller .
docker build -t twobombs/thereminq:cpu -f ./Dockerfile-cpu .

docker build -t twobombs/thereminq:cosmos-cpu -f ./Dockerfile-cosmos-cpu .
docker build -t twobombs/thereminq:cosmos-gpu1 -f ./Dockerfile-cosmos-gpu1 .
docker build -t twobombs/thereminq:cosmos-gpu2 -f ./Dockerfile-cosmos-gpu2 .
docker build -t twobombs/thereminq:cosmos-multi -f ./Dockerfile-cosmos-multi .

docker build -t twobombs/thereminq:cosmos-nbody-cpu -f ./Dockerfile-cosmos-nbody-cpu .
docker build -t twobombs/thereminq:cosmos-nbody-gpu1 -f ./Dockerfile-cosmos-nbody-gpu1 .
docker build -t twobombs/thereminq:cosmos-nbody-gpu2 -f ./Dockerfile-cosmos-nbody-gpu2 .
docker build -t twobombs/thereminq:cosmos-nbody-multi -f ./Dockerfile-cosmos-nbody-multi .

docker build -t twobombs/thereminq:qft-cpu -f ./Dockerfile-qft-cpu .
docker build -t twobombs/thereminq:qft-gpu1 -f ./Dockerfile-qft-gpu1 .
docker build -t twobombs/thereminq:qft-gpu2 -f ./Dockerfile-qft-gpu2 .
docker build -t twobombs/thereminq:qft-multi -f ./Dockerfile-qft-multi .

docker build -t twobombs/thereminq:supreme-cpu -f ./Dockerfile-supreme-cpu .
docker build -t twobombs/thereminq:supreme-gpu1 -f ./Dockerfile-supreme-gpu1 .
docker build -t twobombs/thereminq:supreme-gpu2 -f ./Dockerfile-supreme-gpu2 .
docker build -t twobombs/thereminq:supreme-multi -f ./Dockerfile-supreme-multi .
