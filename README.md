# RS School AWS DevOps Course Task 4



In this task we are installing jenkins service on our k3s cluster via Helm.
Jenkins files repository:
[https://github.com/anatolyostrovsky/rsschool-jenkins-files]

First we need to install helm by running this command:
```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash 
```
Next we update helm repositories and install NginX chart to make sure that all works fine:

![chart](https://github.com/user-attachments/assets/446eac10-52a1-4a26-b91f-70acf3fa2c77)

Now we can move on and install jenkins. First we need to create new namespace by running:
```
sudo kubectl create namespace jenkins
```

Next we clone our yaml files from our new repository to setup Jenkins correctly


```
git clone https://github.com/anatolyostrovsky/rsschool-jenkins-files
```




Then create PV and PVC by applying jenkins-pv.yaml and service account by applying jenkins-sa.yaml from my new github repository:
```
sudo kubectl apply -f rsschool-jenkins-files/jenkins-pv.yaml
sudo kubectl apply -f rsschool-jenkins-files/jenkins-sa.yaml
```


```
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

```
Then we use jenkins-values.yaml from the same repository to install jenkins chart using the values provided.
```
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f rsschool-jenkins-files/jenkins-values.yaml $chart
```
![jenkins-install](https://github.com/user-attachments/assets/19945a7e-d2ff-408a-8f1b-d72b737fdd20)

Then we get the password and link to login to our jenkins.

To access my jenkins service from local machine I used SSH Tunnel with Port Forwarding using Bastion host.
(I could not figure it out how to expose service via Load Balancer or Ingress and I lost so much time trying to achieve it that I just gave up for a while, I'll come back to this later)
Basically we need to update our command with values that Jenkins gives us:

```
ssh -i my-key.pem ec2-user@<public-host-ip> -L 8080:<k3s-private-service-ip>:<jenkins-provided-port>
```
And then we are able to connect to our service on https://localhost:8080

We login to jenkins with our credentials
![Screenshot from 2024-11-03 00-42-42](https://github.com/user-attachments/assets/df596d5e-9f46-49be-876d-29be4ed142b6)

And then create freestyle project that does following
```
echo "Hello World"
```
![Screenshot from 2024-11-03 00-48-21](https://github.com/user-attachments/assets/0a2ad9a8-05f6-40f0-8e2c-fa9a8489d7b3)




