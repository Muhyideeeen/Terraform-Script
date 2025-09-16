# Scalable and Secure Web Application Architecture

This Terraform script sets up an AWS environment with a scalable and secure web application architecture. The infrastructure includes:

- A Virtual Private Cloud (VPC) with public and private subnets.
- Auto Scaling Group of EC2 instances behind an Application Load Balancer.
- An RDS instance for the database.
- Secure communication setup between EC2 instances and the RDS instance.

## Approach

The approach for setting up the scalable and secure web application architecture involves the following steps:

1. Define the Infrastructure: Configure the VPC, subnets, security groups, EC2 instances, load balancer, and RDS instance using Terraform resources.

2. Secure Communication: Establish secure communication between the EC2 instances and the RDS instance by configuring the appropriate security group rules and network access controls.

3. Auto Scaling: Enable auto scaling for the EC2 instances to ensure the application can handle varying levels of traffic and demand.

4. Load Balancing: Set up an Application Load Balancer to distribute incoming traffic across multiple EC2 instances, providing improved availability and scalability.

5. Database Setup: Provision an RDS instance to serve as the database for the web application.

6. Clean Up: Provide instructions for cleaning up the infrastructure when it is no longer needed to avoid unnecessary costs.

## Execution Instructions

To set up the scalable and secure web application architecture, follow these steps:

**Prerequisites:**
- An AWS account
- Terraform installed locally on your machine

**Steps:**
1. Clone or download the repository containing the Terraform script.
2. Configure your AWS credentials using one of the recommended methods, such as AWS CLI configuration or environment variables.
3. Navigate to the directory where the Terraform script files are located.
4. Open the `variables.tf` file and review the available variables. Modify the default values if needed to match your requirements.
5. Run the command `terraform init` to initialize the Terraform project.
6. Run the command `terraform plan` to review the planned changes and verify the infrastructure setup.
7. Run the command `terraform apply` to create the infrastructure. Review the proposed changes and type "yes" to confirm and apply the changes.
8. Wait for Terraform to complete the provisioning process.
9. Once the provisioning is complete, access the web application using the load balancer's DNS name.
10. To clean up the infrastructure, run the command `terraform destroy` to destroy all the created resources. Review the proposed changes and type "yes" to confirm the destruction.

## Challenges Faced and Solutions

During the task, the following challenges were encountered and addressed:

1. Security Group Configuration: Configuring security groups to allow secure communication between the EC2 instances and the RDS instance while restricting unnecessary access.
   - Solution: Detailed ingress and egress rules were defined in the security group resources to allow specific traffic and block other traffic.

2. Load Balancer Configuration: Setting up the Application Load Balancer and configuring listeners, target groups, and routing rules.
   - Solution: The Terraform script was updated to include the necessary load balancer resources and configuration, such as listener and target group definitions.

3. Database Setup: Provisioning an RDS instance with appropriate configurations and connecting it to the private subnet.
   - Solution: The Terraform script was enhanced to include the RDS instance resource and its associated settings, such as engine type, instance class, and database name.

## Design and Technology Choices

The design and technology choices made during the task were based on the following considerations:

1. Scalability: The architecture includes an Auto Scaling Group and Application Load Balancer to handle varying levels of traffic and provide high availability.

2. Security: Secure communication between the EC2 instances and the RDS instance is ensured by configuring security groups with appropriate rules and network access controls.

3. Infrastructure-as-Code: Terraform was chosen as the infrastructure provisioning tool due to its ease of use, declarative syntax, and support for managing AWS resources.

4. AWS Services: The architecture leverages AWS services like VPC, EC2, Application Load Balancer, and RDS to benefit from their scalability, availability, and managed features.

5. Separation of Public and Private Subnets: The use of public and private subnets within the VPC helps ensure a secure network architecture by isolating the web-facing components from the database.

6. Flexibility: The Terraform script includes configurable variables to allow customization based on specific requirements, such as AMI, instance type, and database configurations.

Please refer to the Terraform documentation and AWS documentation for more details on the technologies used and the specific resource configurations.
new 1
