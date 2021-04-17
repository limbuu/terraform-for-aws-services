
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
    Then, use profile with terraform files:
    ```
        provider "aws" {
            profile = "terraform-user"
            region = "us-west-2"
        }
    ```

## AWS EC2
### EC2 with default network configuration

### EC2 with custom network configuration

