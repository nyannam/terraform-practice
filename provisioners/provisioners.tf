provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "my-ec2" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name      = var.keyname
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/Users/naga.yannam/Downloads/terraform-key.pem")
      host        = self.public_ip
    }
  }
}