variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

resource "aws_instance" "example" {
  ami                    = "ami-03e31863b8e1f70a5"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data              = <<-EOF
	      #!/bin/bash
	      echo "Hello, World" > index.xhtml
	      nohup busybox httpd -f -p "${var.server_port}" &
	      EOF

  user_data_replace_on_change = true

  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_security_group" "instance" {
  name = "dev-ec2-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
