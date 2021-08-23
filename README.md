# AWS Deployment
This repo/project deploys an EC2 instance with a mounted EFS file system.

### CI/CD
This repo uses GitHub actions for CI/CD and uses Terraform Cloud for state management.
When changes are merged into the "main" branch they are automatically applied and deployed (assuming they pass the proper checks).

### File Storage Module
This deploys the following:
-EFS file system

### Compute Module
This deploys the following: 
-EC2 instance with a user data script that mounts the EFS file system
-A security group

### Networking Module
This deploys the following: 
-A VPC 
-A singular subnet

