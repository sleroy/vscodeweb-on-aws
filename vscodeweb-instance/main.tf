terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



resource "aws_instance" "vscodeweb_ec2_instance" {
  count                       = 1
  ami                         = data.aws_ami.vscodeweb_ami.id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  security_groups             = [ var.security_id ]
  associate_public_ip_address = true

  subnet_id = var.subnet_id

  tags = {
    Name = var.instance_tag
  }
  
  provisioner "remote-exec" {
    inline = [
        "sudo adduser --disabled-password --gecos '' myuser",
        "sudo mkdir -p /home/myuser/.ssh",
        "sudo touch /home/myuser/.ssh/authorized_keys",
        "sudo echo '${var.ssh_key_path}' > authorized_keys",
        "sudo mv authorized_keys /home/myuser/.ssh",
        "sudo chown -R myuser:myuser /home/myuser/.ssh",
        "sudo chmod 700 /home/myuser/.ssh",
        "sudo chmod 600 /home/myuser/.ssh/authorized_keys",
        "sudo usermod -aG sudo myuser"
   ]

    connection {
     user     = "ubuntu"
    }

  }
}
