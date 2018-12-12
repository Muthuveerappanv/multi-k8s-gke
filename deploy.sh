# Build
docker build -t muthu8891/multi-client:latest -t muthu8891/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t muthu8891/multi-server:latest -t muthu8891/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t muthu8891/multi-worker:latest -t muthu8891/multi-worker:$SHA -f ./worker/Dockerfile ./worker
#Push
docker push muthu8891/multi-client:latest
docker push muthu8891/multi-server:latest
docker push muthu8891/multi-worker:latest

docker push muthu8891/multi-client:$SHA
docker push muthu8891/multi-server:$SHA
docker push muthu8891/multi-worker:$SHA
# Kubectl Install
kubectl apply -f k8s
#Tag Image to latest
kubectl set image deployments/server-deployment server=muthu8891/multi-server:$SHA
kubectl set image deployments/client-deployment client=muthu8891/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=muthu8891/multi-worker:$SHA