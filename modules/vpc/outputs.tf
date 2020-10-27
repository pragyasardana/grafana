output "vpc_id" {
  value = aws_vpc.grafana_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.grafana_vpc.cidr_block
}

output "db_subnet_group" {
  value = aws_db_subnet_group.grafana_rds_subnet_group.name
}

output "public_subnet" {
  value = aws_subnet.grafana_public_subnet.*.id
}

output "private_subnet" {
  value = aws_subnet.grafana_private_subnet.*.id
}
