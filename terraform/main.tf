resource "aws_key_pair" "deployer" {

  key_name   = "infra-key"

  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_vpc" "default" {

  default = true
}

resource "aws_security_group" "allow_ssh" {

  name = "allow_ssh"

  description = "Allow SSH and HTTP"

  vpc_id = data.aws_vpc.default.id

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "HTTP"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devvm" {

  ami = "ami-0c02fb55956c7d316"

  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "Developer-VM"
  }

  provisioner "local-exec" {

    command = "bash ../scripts/ansible.sh ${self.public_ip}"
  }
}
