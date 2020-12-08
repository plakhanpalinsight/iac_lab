#Configure the AWS provider
provider "aws" {
  region                  = var.region
  shared_credentials_file = var.aws_credential_file_path
  profile                 = var.aws_profile
}

#################################################
# ssh key 
# Use a public keypair we specify
resource "aws_key_pair" "public_key" {
    key_name   = "${var.projectName}-${var.stageName}-key"
    public_key = "${file(var.publicSshKey)}"
}