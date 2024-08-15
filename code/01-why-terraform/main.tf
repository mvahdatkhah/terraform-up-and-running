resource "aws_instance" "example" {
  ami           = "ami-03e31863b8e1f70a5"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.xhtml
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "dev-ec2"
  }
}
