# hello_app_service
just a hello app service to use it on pipeline tests

# Running the app within containers
## running using docker

On root directory:
```
docker build -t hello_service:v1 .
docker run -p 5000:80 hello_service:v1
``` 
access http://localhost:5000

## running on kubernetes (minikube)
```
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)
docker build -t hello_service:v1 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
minikube service --url http-hello-service
```
Access the URL on the terminal

# Performance tests with locust
```
cd tests
pip3 install locust
locust
```
- It will show the link for the web client
- Add the url you want to test and configure user agents through the web interface
- Start the test and go to charts view for better visualization