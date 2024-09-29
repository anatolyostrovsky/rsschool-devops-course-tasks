# RS School AWS DevOps Course Task 1

![example workflow](https://github.com/anatolyostrovsky/rsschool-devops-course-tasks/actions/workflows/newworkflow.yml/badge.svg)

For the first Part of the task we have to create a non root user account secured by MFA

![screen2](https://github.com/user-attachments/assets/a9b2e2ca-a2d2-4e25-8375-02e6afd82174)

Next we have to make sure we have AWS CLI and Terraform installed

![screen3](https://github.com/user-attachments/assets/6dac63e0-e5e5-4a6d-a794-902465c233cf)

Then Terraform is used to create new AWS Role with required policies and encrypted S3 Bucket. The files are iam.yml for the role and bucket.yml for S3 Bucket.
There is separate files for configuration and variables as well as outputs file to see our resources arns when they are created.
When we are sure that code is working, it is time to create a Github Actions workflow. Here important part is to protect sensitive data with Github Secrets.
Here we have 3 jobs to create. When one is completed the next one starts. And finally 2 new resources are created. Happy Days!

![Screen4](https://github.com/user-attachments/assets/34cd4b56-75ea-4e91-a3b6-b8b3d23ab189)
