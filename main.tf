variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

provider "aws" {
  region = var.region
  profile = "your aws cli key"  
}