resource "aws_instance" "webserver" {
  ami           = data.aws_ami.this.id
  instance_type = "t2.medium"
  user_data = filebase64("scripts/userdata.sh")
  tags = {
    Name = "WebServer"
  }
}