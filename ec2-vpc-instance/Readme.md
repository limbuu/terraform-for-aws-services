# Terraform for AWS EC2 Instance

## Requirements
The list of the resources to be created to run EC2 instance inside a virtual private network include:

1. VPC
2. Internet Gateway associated with VPC
3. Subnet inside VPC
4. Route Table inside VPC with a route that directs internet-bound traffic to the internet gateway
5. Route table association with our subnet to make it a public subnet
6. Security group inside VPC that allows ssh in
7. Key pair used to SSH EC2 instance
8. EC2 instance inside our public subnet with an associated security group and a generated key pair

Now, using terraform we will create a EC2 instance with custom network settings (custom vpc, public subnet, security group) and other custom properties. Thus, our customizable input variables can be summarized as:

1. CIDR block for VPC
2. CIDR block for subnet which is a subset of CIDR block of VPC
3. Availability zone which is used to create our subnet
4. The public key path which is used in Key pair creation
5. AMI which is used to create EC2 instance
6. Instance type of EC2 instance
7. With AWS, we can start adding tags to track our resources. We are using environment tag.

## Terraform Steps
1. Clone the repo
    First, clone this repo and then go to `ec2-vpc-instance`directory. This directory contains necessary terraform files to provision the custom vpc configured EC2 instance.
    ```
    $ git clone https://github.com/limbuu/terraform-for-aws-services.git
    $ cd terraform-for-aws-services/ec2-vpc-instance
    $ tree
    .
    ├── output.tf
    ├── Readme.md
    ├── variables.tf
    └── vpc-ec2.tf
    ```

    Note:
    * `vpc-ec2.tf` contains the required different resources configuration needed to create a EC2 instance with custom network configuration.
    * `variables.tf` conatins the variables to be applied to the main terraform file vpc-ec2.tf. 
    * `output.tf` contains the defined ouputs we want to print for visualization.

2. Initialize Directory
    
    Now, initialize the directory with `terraform init` to download and install the provider which is `aws` here in hidden directory `.terraform`.
    ```
    $ terraform init
    ```
    Now, make sure the configuration is syntatically valid before creating the infrastructure:
    ```
    $ terraform validate
    Success! The configuration is valid.

3. Create Infrastructure

    Now, apply the configuration using command `terraform apply` to create custom `vpc configured EC2 instance` from the configuration file.
    ```
    $ terraform apply 
    ```

4. Inspect State
    
    After applying configuration, Terraform stores the properties and values of the newly created infrastructure in a file `terraform.tfstate`, such that it can update or destroy those resources whenever needed. You can inspect the current state running command:

    ```
    $ terraform show
    ```

5. Destrory Infrastructure

    The `terraform destroy` command destroys the infrastruce resources (ec2, vpc, subnet and security group) created using Terraform configuration. 
    ```
    $ terraform destroy 
    ```