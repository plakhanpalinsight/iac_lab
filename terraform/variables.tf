# variables.tf – commonly configured parameters for our environment (i.e. projectName)

#################################################
# AWS Region
variable "region" {
	default = "us-west-1"
}
variable "availZones" {
	type = "list"
	default = ["us-west-1a", "us-west-1c"]
}

#################################################
# Project naming

variable "projectName" {
	default = "puneethashi"
}
variable "stageName" {
	default = "dev"
}
variable "costCenter" {
	default = "1234.5678"
}

#################################################
# web/app servers

# EC2 Instances
variable "webInstanceType" {
	default = "t2.micro"
}
variable "publicSshKey" {
	default = ".//ssh/id_rsa.pub"
}

# Autoscaling Group
variable "tgtGrpDesiredSize" {
	default = "2"
}
variable "tgtGrpMinSize" {
	default = "2"
}
variable "tgtGrpMaxSize" {
	default = "2"
}
variable "healthCheckGracePeriod" {
	#default = "300" # a sane number
	default = "90" # faster for testing
}

###############################################################
# Network Vars

variable "vpcCidr" {
	default = "10.0.0.0/16"
}
variable "publicCidrs" {
	type = "list"
	default = ["10.0.0.0/24", "10.0.1.0/24"]
}
variable "appCidrs" {
	type = "list"
	default = ["10.0.10.0/24", "10.0.11.0/24"]
}
variable "databaseCidrs" {
	type = "list"
	default = ["10.0.20.0/24", "10.0.21.0/24"]
}

###############################################################
# Vault Server

variable "vaultInstanceType" {
	default = "t2.micro"
}

###############################################################
# Database 

variable "dbRootUser" {
	default = "root"
}
variable "dbRootPass" {
	default = "password"
}
variable "dbInstanceCount" {
	default = "1"
}
variable "dbInstanceType" {
	default = "db.t2.small"
}
variable "dbBackupRetention" {
	default = "7"
}

##############################################################
# Data Lookups
data "aws_ami" "awsLinux2Ami" {
	most_recent = true
	owners      = ["amazon"]
	filter {
		name = "owner-alias"
		values = ["amazon"]
	}
	
	filter {
		name = "name"
		values = ["amzn2-ami-hvm-*-x86_64-ebs"]
	}
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
}


variable "name_prefix" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "environment" {
  type = string
}

variable "approval" {
  type = string
}

variable "aws_account" {
  type = string
}

variable "subscriptions" {
  description = "List of telephone numbers to subscribe to SNS."
  type        = list(string)
}

variable "aws_credential_file_path" {
  type = string
}

variable "aws_profile" {
  type = string
}
