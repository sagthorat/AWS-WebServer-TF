resource "aws_instance" "web" {
  ami           = data.aws_ami.this
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}