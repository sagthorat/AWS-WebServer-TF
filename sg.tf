# resource "aws_security_group" "allow_http_ssh" {

#   name        = "allow_http"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = data.aws_vpc.this.id


#   tags = {
#     Name = "allow_http"
#   }
# }
# resource "aws_vpc_security_group_ingress_rule" "allow_http" {
#   security_group_id = aws_security_group.allow_http_ssh.id

#   from_port   = 80
#   to_port     = 80
#   ip_protocol = "tcp"
#   cidr_ipv4   = "0.0.0.0/0"

# }
# resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
#   security_group_id = aws_security_group.allow_http_ssh.id

#   from_port   = 22
#   to_port     = 22
#   ip_protocol = "tcp"
#   cidr_ipv4   = "0.0.0.0/0"

# }
# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_http_ssh.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }


module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
}