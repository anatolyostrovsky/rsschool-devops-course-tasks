# RS School AWS DevOps Course Task 2

In this task we are setting up infrastructure for future projects. Following terraform code contains Contains VPC, 2 Public and 2 Private Subnets in 2 Availability zones.
It also creates Internet Gateway fro public subnets and NAT Gateway for private ones. Here we can see that everything sets up fine.
![resoucemap](https://github.com/user-attachments/assets/25cec71e-4b52-4414-8ca0-15f1fca11a5b)

Next we create 2 EC2 instances, each one in its own private subnet. To be able to connect to them via SSH we create EC2 Instance in public subnet, and attach a public IP to it. It will act as a Bastion Host. Additionaly we create key-pair and store it locally to use it with the SSH Agent. On the following screenshot you can see Bastion Host in action.
First we add our key-pair to SSH Agent then we connect to Bastion Host Publc IP. From there we connect to our private instance using private IP. And the we check that our private EC2 is able to connect to the internet outside VPC.

![bastion](https://github.com/user-attachments/assets/4f768542-fcc1-45e6-9c7a-160fc385aa9c)
