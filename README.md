# AWS Deployment
This repo/project deploys an EC2 instance with a mounted EFS file system.
***
#### Room for improovement 
This a simplistic design and is not fault tolerant. If this were to be made more complex, the following changes could be made:
* Add an auto scaling group for the EC2 instances
* Add a load balancer for the auto scaling group
* Add additional EFS mount points
* Add additional subnets and design the networking module to be more flexible

***
### CI/CD
This repo uses GitHub actions for CI/CD and uses Terraform Cloud for state management.
When changes are merged into the "main" branch they are automatically applied and deployed (assuming they pass the proper checks).
***
### File Storage Module
This deploys the following: <br>
-EFS file system
***
### Compute Module
This deploys the following: <br>
-EC2 instance with a user data script that mounts the EFS file system<br>
* it can take serveral minutes for the efs file system to mount
* you can check if the file system has been mounted by using this command: df -h
***
### Networking Module
This deploys the following: <br> 
-A VPC <br>
-A security group <br>
-A singular subnet
***

