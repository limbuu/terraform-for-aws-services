
# Terraform for AWS Services
## Prerequisties
* [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* [An AWS Account](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

## Installation
1. Install latest terraform CLI:

    First, dowload the pre-compiled [binary package](https://www.terraform.io/downloads.html) or any appropiate package from the source. Now, unzip and move it to `/usr/local/bin` path.
    ```
    $ unzip terraform.zip
    $ mv ~/Downloads/terraform /usr/local/bin/
    ```
    Verify the installation:
    ```
    $ terraform -help
    ```
2. Install AWS CLI V2(For Linux):

    To install latest version of AWS CLI, use commands as follows:
    ```
    $ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    $ unzip awscliv2.zip
    $ sudo ./aws/install
    ```
3. Create an AWS account:

    Now, create an aws account following [link](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all).We will use the secret credentials of this aws account to interact with AWS Services.

4. Use AWS credentials:

    There are two ways to use aws credentials. 

    First is, directly using with terraform files which exposes the credentials when files are shared or pushed to pubic repositories. 
    ```
        provider "aws" {
            access_key = "AKIAIOSFODNN7EXAMPLE"
            secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
            region = "us-west-2"
        }
    ```
    Therefore, to avoid such situation we will configure basic AWS CLI settings to interact with AWS.
    ```
    $ aws configure --profile terraform-user
    AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
    AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    Default region name [None]: us-west-2
    Default output format [None]: json

    ```
    The configuration process stores your credentials with a profile name in a file at ~/.aws/credentials. Now, use this profile with terraform files:
    ```
        provider "aws" {
            profile = "terraform-user"
            region = "us-west-2"
        }
    ```

## Terraform Steps
1. Create Directory

    The set of files with `.tf` extension is used to describe infrastructure in Terraform, which is called Terraform `configuration`. Each Terraform `configuration` must be inside its working directory, so create one first. 
    ```
    $ mkdir terraform-demo
    ```
2. Write Cofiguration

    Now, inside the directory create a Terraform file to define your infrastructure. 
    ```
    $ cd terraform-demo
    $ touch main.tf
    ```
    For quick example, we will create a `AWS EC2 instance` as an infrastructure here. Therefore, paste below configuration in `main.tf`. It is basic configuration with default network settings (default vpc, default public subnet and randomly generated default security group).
    ```
    terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 3.36"
        }
    }
    }
    provider "aws" {
    profile = "terraform-user"
    region  = "us-west-2"
    }

    resource "aws_instance" "app_server" {
    ami           = "ami-830c94e3"
    instance_type = "t2.micro"

    tags = {
        "Name" = "EC2-By-Terraform"
        "Environment" = "demo-purpose"
    }
    }

    ```
Note: 

    * terraform {} block contains Terraform settings, including provisioner settings.
    * provider {} block configures the specific provider/plugin (aws here) settings to provision/manage your resources.
    * resource {} blocks define different component of your infrastucture.
    * tags {} block defined inside resource block {} attach tags to that resource when provisioned.

3. Initialize Directory
    
    Now, initialize the directory with `terraform init` to download and install the provider which is `aws` here in hidden directory `.terraform`.
    ```
    $ terraform init
    ```
    Now, make sure the configuration is syntatically valid before creating the infrastructure:
    ```
    $ terraform validate
    Success! The configuration is valid.

4. Create Infrastructure

    Now, apply the configuration using command `terraform apply` to create the infrastructure from the configuration file.
    ```
    $ terraform apply 
    ```

5. Inspect State
    
    After applying configuration, Terraform stores the properties and values of the newly created infrastructure in a file `terraform.tfstate`, such that it can update or destroy those resources whenever needed. You can inspect the current state running command:

    ```
    $ terraform show
    ```

6. Destrory Infrastructure

    The `terraform destroy` command destroys the infrastruce resources created using Terraform configuration. 
    ```
    $ terraform destroy 
    ```

Useful Links:
* [Terraform Official Documentation](https://learn.hashicorp.com/terraform)
