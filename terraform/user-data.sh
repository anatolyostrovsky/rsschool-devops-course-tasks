#!/bin/bash

curl -sfL https://get.k3s.io | sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
echo "k3s server installed sucessfully"

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
echo "Helm installed successfully"

sudo yum install git -y
sudo git clone https://github.com/anatolyostrovsky/wp-helm-chart.git
echo "Git installed and chart repository copied"

cd wp-helm-chart
sudo su
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm install wordpress wordpress-chart
echo "Wordpress service is now live and available on port 30080"

cd ..
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
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

helm install grafana grafana/grafana \
  --namespace monitoring \
  --set service.type=NodePort \
  --set service.nodePort=30098 \
  --set adminPassword=qwerty

echo "Grafana installed and running on port 30098, username = admin, password = qwerty, please change it with your first login."

yum install stress
yum install sysbench

