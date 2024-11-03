# RS School AWS DevOps Course Task 4

In this task we are installing jenkins service on our k3s cluster via Helm.
First we need to ijnstall helm by running this command:
```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash 
```



![screen2](https://github.com/user-attachments/assets/a9b2e2ca-a2d2-4e25-8375-02e6afd82174)

Next we have to make sure we have AWS CLI and Terraform installed

![screen3](https://github.com/user-attachments/assets/6dac63e0-e5e5-4a6d-a794-902465c233cf)

Then Terraform is used to create new AWS Role with required policies and encrypted S3 Bucket. The files are iam.yml for the role and bucket.yml for S3 Bucket.
There is separate files for configuration and variables as well as outputs file to see our resources arns when they are created.
When we are sure that code is working, it is time to create a Github Actions workflow. Here important part is to protect sensitive data with Github Secrets.
Here we have 3 jobs to create. When one is completed the next one starts. And finally 2 new resources are created. Happy Days!

![Screen4](https://github.com/user-attachments/assets/34cd4b56-75ea-4e91-a3b6-b8b3d23ab189)

```
ssh -i my-key.pem ec2-user@<public-host-ip> -L 8080:<k3s-private-service-ip>:80
```
