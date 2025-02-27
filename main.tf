resource "aws_instance" "webserver" {
  ami           = data.aws_ami.this.id
  instance_type = "t2.medium"
  user_data = filebase64("scripts/userdata.sh")
  lifecycle {
    replace_triggered_by = [
      # Replace `aws_appautoscaling_target` each time this instance of
      # the `aws_ecs_service` is replaced.
      aws_instance.webserver.id
    ]
  }
  tags = {
    Name = "WebServer"
  }
}