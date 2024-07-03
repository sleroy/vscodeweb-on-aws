#---------------------------------
# network and security
#---------------------------------
variable "availability_zone" {
  description = "The availability zone where do you want to host your VSCode web instance"
  type = string
  default  = "us-east-1a"
}


variable "aws_region" {
  description ="AWS Region where your VSCode web instance will be located"
  type = string
  default  = "us-east-1"
}


variable "security_id" {
    type = string
}

variable "subnet_id" {
    type = string
}

#------------------
#Key Pair Variables
#------------------
variable "key_pair_name" {
  description = "Key Pair for ssh access to instance"
  type        = string
  default     = "id_rsa"
}

variable "file_name" {
  description = "Name of the key pair file"
  type        = string
}

#------------------
# ec2 VARIABLES
#------------------


variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "m6a.large"
}

variable "instance_tag" {
  description = "Tag given to each deployed Instance"
  type = string 
  default = "vscodeweb-instance"
}

