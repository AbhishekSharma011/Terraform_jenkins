**Jenkins Infrastructure on AWS with Terraform**
This repository contains Terraform code to set up Jenkins infrastructure on AWS. It provisions an EC2 instance with Jenkins installed and configures security groups and other dependencies.

**Features**
Automates the setup of Jenkins on an EC2 instance.
Uses Terraform to provision AWS resources like EC2, security groups, and key pairs.
Configurable security group rules (SSH, HTTP).
Automatically installs and configures Jenkins via provisioners.
Supports SSH connection to the instance using your key pair.

**Prerequisites**
AWS account with necessary permissions (EC2, VPC, Security Groups, etc.).
AWS CLI configured with your credentials.
Terraform installed on your local machine.
Existing key pair in AWS (or create a new one).
Public IP of your machine (for SSH and HTTP access).

**Getting Started**
**Clone the Repository:**
git clone (https://github.com/AbhishekSharma011/Terraform_jenkins.git)
$ cd jenkins-terraform-aws

**Configure Variables: Update the terraform.tfvars file with your values:**

my_ip: Your public IP address (for SSH and Jenkins access).
key_name: The name of your existing AWS key pair.

Initialize Terraform:
**terraform init**

Plan and Apply:
To see the changes that will be applied:

**terraform plan**

To apply the changes:

**terraform apply** 

Access Jenkins:

After applying the changes, note the public IP of the Jenkins EC2 instance.
Access Jenkins via the web browser:

**http://<jenkins_public_ip>:8080**
File Structure
**
├── main.tf                # Main Terraform configuration
├── variables.tf           # Terraform variables definition
├── terraform.tfvars       # User-specific variables
├── setup_jenkins.sh       # Script to install and configure Jenkins
├── outputs.tf             # Outputs (like public IP of Jenkins)
└── README.md              # This file**
Customization
Modify setup_jenkins.sh if you need to install additional plugins or dependencies for Jenkins.
You can add more security group rules if required, e.g., for additional ports.
Cleanup
To remove the infrastructure when you're done, run:


**terraform destroy**
