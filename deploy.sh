docker build -t y8zhuang/multi-client:latest -t y8zhuang/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t y8zhuang/multi-server:latest -t y8zhuang/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t y8zhuang/multi-worker:latest -t y8zhuang/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push y8zhuang/multi-client:latest
docker push y8zhuang/multi-server:latest
docker push y8zhuang/multi-worker:latest
docker push y8zhuang/multi-client:$SHA
docker push y8zhuang/multi-server:$SHA
docker push y8zhuang/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=y8zhuang/multi-client:$SHA
kubectl set image deployments/server-deployment server=y8zhuang/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=y8zhuang/multi-worker:$SHA
