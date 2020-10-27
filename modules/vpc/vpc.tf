
resource "aws_vpc" "grafana_vpc" {
  cidr_block = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "grafana_public_subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.grafana_vpc.id
  cidr_block              = "10.0.${10 + count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
}

resource "aws_subnet" "grafana_private_subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.grafana_vpc.id
  cidr_block              = "10.0.${20 + count.index}.0/24"
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[count.index]
}

resource "aws_db_subnet_group" "grafana_rds_subnet_group" {
  name       = "grafana_rds_subnet_group"
  subnet_ids = aws_subnet.grafana_private_subnet.*.id
}

resource "aws_internet_gateway" "grafana_gateway" {
  vpc_id = aws_vpc.grafana_vpc.id
}

resource "aws_route_table" "grafana_internet_access" {
  vpc_id = aws_vpc.grafana_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.grafana_gateway.id
  }
}

resource "aws_nat_gateway" "grafana-nat-gateway" {
  allocation_id = aws_eip.grafana-test-eip.id
  subnet_id     = aws_subnet.grafana_public_subnet.0.id
}

resource "aws_eip" "grafana-test-eip" {
  vpc = true
}

resource "aws_default_route_table" "private_route" {
  default_route_table_id = aws_vpc.grafana_vpc.default_route_table_id

  route {
    nat_gateway_id = aws_nat_gateway.grafana-nat-gateway.id
    cidr_block     = "0.0.0.0/0"
  }
}


resource "aws_route_table_association" "private_subnet_assoc" {
  count          = length(data.aws_availability_zones.available.names)
  route_table_id = aws_default_route_table.private_route.id
  subnet_id      = aws_subnet.grafana_private_subnet.*.id[count.index]
  depends_on     = [aws_default_route_table.private_route, aws_subnet.grafana_private_subnet]
}

resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(data.aws_availability_zones.available.names)
  route_table_id = aws_route_table.public_route.id
  subnet_id      = aws_subnet.grafana_public_subnet.*.id[count.index]
  depends_on     = [aws_route_table.public_route, aws_subnet.grafana_public_subnet]
}


resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.grafana_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.grafana_gateway.id
  }
}
