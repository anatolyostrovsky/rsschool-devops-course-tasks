# RS School AWS DevOps Course Task 7

For this task I am using my Wordpress cluster created in task 5. I updated my script with following command:
```
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "server:
  service:
    type: NodePort
    nodePort: 30099

additionalScrapeConfigs:
  - job_name: 'mysql'
    static_configs:
      - targets: ['mysql-exporter-prometheus-mysql-exporter:9104']

extraScrapeConfigsSecret:
  enabled: true

nodeExporter:
  enabled: true

mysql-exporter-prometheus-mysql-exporter:
  enabled: true
  service:
    port: 9104" > values.yaml

helm install mysql-exporter prometheus-community/prometheus-mysql-exporter --namespace monitoring
    
helm install prometheus prometheus-community/prometheus --namespace monitoring -f values.yaml
echo "Prometheus installed and running on port 30099"
```
This will install Prometheus and additional exporters in a new namespace. It will also expose it on port 30099.

![prometheus-svc](https://github.com/user-attachments/assets/5ed705af-10ed-4ebd-8997-9d5538243e76)

All necessary services are running so we can access our prometheus server and check it by running simple query checking memory usage.
```
node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes
```

![prometheus_memory](https://github.com/user-attachments/assets/e613e9cb-f5fb-40ce-b70d-351e30adf0a1)

Everything seems to be working just fine.
