
resource "aws_instance" "web" {
  count = var.instance_count 
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = var.vm_types[0]
  # region = tolist(var.available_regions)[0]
  region = var.config.region

  monitoring = var.monitoring
  associate_public_ip_address = var.associate_public_ip

  tags = var.tags
} 


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_blocks[1]
  from_port         = var.ingress_value[0]
  ip_protocol       = var.ingress_value[1]
  to_port           = var.ingress_value[2] 
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


