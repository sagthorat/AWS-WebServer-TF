data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Amazon Linux 2023 AMI 2023.6.20250218.2 x86_64 HVM kernel-6.1*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
  
}