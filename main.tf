resource "aws_instance" "web" {
  ami           = data.aws_ami.this.id
  instance_type = "t3.micro"
  user_data = filebase64("/scripts/userdata.sh")
  tags = {
    Name = "HelloWorld"
  }
}