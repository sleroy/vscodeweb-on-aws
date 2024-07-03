variable "ssh_key_path" {
    type = string
    default = "~/.ssh/id_rsa.pub"
    description ="Provides the SSH key path"
}

data "aws_ami" "vscodeweb_ami" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
  
}

variable "security_id" {
    type = string
}

variable "subnet_id" {
    type = string
}