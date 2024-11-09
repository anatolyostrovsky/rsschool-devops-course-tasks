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
