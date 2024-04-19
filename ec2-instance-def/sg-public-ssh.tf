resource "aws_security_group" "sg-ssh" {
  name        = "allow-ssh"
  description = "Allow Inbound ssh on port 22"
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.sg-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_ssh_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}