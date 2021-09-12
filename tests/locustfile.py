from locust import HttpUser, task

class HelloServiceUser(HttpUser):
    @task
    def hello_service(self):
        self.client.get("/")