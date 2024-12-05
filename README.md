# RS School AWS DevOps Course Task 8

For this task I am updating my user-data to install Grafana via IaC. [Click here](https://github.com/anatolyostrovsky/rsschool-devops-course-tasks/blob/task8/terraform/user-data.sh) to check the script.
Grafana will be installed in a "monitoring" namespace together with Prometheus. To verify installation we can run:
```
kubectl get pods -n monitoring
```
![grafana-pods](https://github.com/user-attachments/assets/c5d40c4b-80e0-40c1-b3b8-38a81929f450)


This will install Prometheus and additional exporters in a new namespace. It will also expose it on port 30099.

![prometheus-svc](https://github.com/user-attachments/assets/5ed705af-10ed-4ebd-8997-9d5538243e76)

All necessary services are running so we can access our prometheus server and check it by running simple query checking memory usage.
```
node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes
```

![prometheus_memory](https://github.com/user-attachments/assets/e613e9cb-f5fb-40ce-b70d-351e30adf0a1)

Everything seems to be working just fine.
