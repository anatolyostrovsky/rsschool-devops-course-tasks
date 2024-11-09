# RS School AWS DevOps Course Task 5

In this task we are creating helm chart for Wordpress application an installing it.
Git repository with chart files is [here](https://github.com/anatolyostrovsky/wp-helm-chart).


To install the app we update our instance user data with following code:
```
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
```
We can check that our service is up and running using ```kubectl get svc```
![svc-wp2](https://github.com/user-attachments/assets/ce82ecf3-e552-45bd-91e2-cf5dbc7752d0)

Now our Wordpress is available on port 30080 on our public IP.
![wp](https://github.com/user-attachments/assets/6307ff84-221b-4a2c-af0c-1f73ed9a7f2c)
That is everything necessary to complete task 5 :)
