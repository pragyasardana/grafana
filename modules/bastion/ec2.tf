resource "aws_key_pair" "grafana_bastion_ssh_key" {
  key_name   = "grafana_bastion_ssh_key"
  public_key = file(var.bastion_public_key)
}

resource "aws_instance" "bastion" {
  ami             = var.bastion_ami
  instance_type   = var.bastion_size
  key_name        = aws_key_pair.grafana_bastion_ssh_key.key_name
  subnet_id       = var.public_subnet[0]
  security_groups = [aws_security_group.grafana_bastion_sg.id]
}
