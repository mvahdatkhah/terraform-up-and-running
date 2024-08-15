resource "aws_instance" "example" {
  ami           = "ami-03e31863b8e1f70a5"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-ec2"
  }
}
