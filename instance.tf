resource "aws_instance" "webserver" {
  ami           = data.aws_ami.this.id
  instance_type = "t2.medium"
  user_data     = filebase64("scripts/userdata.sh")
  vpc_security_group_ids = [
    aws_security_group.allow_http.id
  ]
  tags = {
    Name = "WebServer001"
  }
}