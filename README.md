# hello_app_service
just a hello app service to use it on pipeline tests

# running using docker

On root directory:
```
docker build -t hello_service:v1 .
docker run -p 5000:80 hello_service:v1
``` 
access http://localhost:5000

# running on kubernetes (minikube)
```
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)
docker build -t hello_service:v1 .
kubectl apply -f deployment.yaml
```