# Scalable and Secure Web Application Architecture

This Terraform script sets up an AWS environment with a scalable and secure web application architecture. The infrastructure includes:

- A Virtual Private Cloud (VPC) with public and private subnets.
- Auto Scaling Group of EC2 instances behind an Application Load Balancer.
- An RDS instance for the database.
- Secure communication setup between EC2 instances and the RDS instance.

## Architecture Overview

The architecture consists of the following components:

- VPC: A Virtual Private Cloud that provides an isolated network environment for your resources.
- Subnets: Public and private subnets created within the VPC. The public subnet is used for the EC2 instances, and the private subnet is used for the RDS instance.
- Security Groups: A security group for the EC2 instances and a separate security group for the RDS instance. These groups define inbound and outbound traffic rules to ensure secure communication.
- Auto Scaling Group: An Auto Scaling Group that automatically scales the number of EC2 instances based on demand.
- Application Load Balancer: A load balancer that distributes incoming traffic to the EC2 instances.
- RDS Instance: An RDS instance running a MySQL database for the web application.

Secure communication between the EC2 instances and the RDS instance is ensured by appropriate security group configurations and network access controls.

## Execution Instructions

To set up the scalable and secure web application architecture, follow these steps:

1. Prerequisites:
   - An AWS account.
   - Terraform installed locally on your machine.

2. AWS Credentials:
   - Configure your AWS credentials using one of the recommended methods, such as AWS CLI configuration or environment variables.

3. Terraform Execution:
   - Clone or download the repository containing the Terraform script.
   - Navigate to the directory where the script files are located.

4. Variable Configuration:
   - Open the `variables.tf` file and review the available variables.
   - Modify the default values if needed to match your requirements.

5. Terraform Initialization:
   - Run `terraform init` to initialize the Terraform project.

6. Plan the Infrastructure:
   - Run `terraform plan` to review the planned changes and verify the infrastructure setup.

7. Apply the Infrastructure Changes:
   - Run `terraform apply` to create the infrastructure.
   - Review the proposed changes and type "yes" to confirm.

8. Wait for Provisioning:
   - Terraform will provision the resources based on your configuration.
   - Wait for the process to complete.

9. Access the Web Application:
   - Once the provisioning is complete, you can access the web application by using the load balancer's DNS name.

Remember to destroy the infrastructure when it's no longer needed by running `terraform destroy` to avoid incurring unnecessary costs.

For any further assistance or troubleshooting, please refer to the Terraform documentation or reach out to the infrastructure team.

