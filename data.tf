data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Amazon Linux 2023 AMI*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
  
}