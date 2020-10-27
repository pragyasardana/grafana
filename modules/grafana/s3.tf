resource "aws_s3_bucket" "grafana_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  for_each = fileset(path.module, "ansible/**")
  bucket   = aws_s3_bucket.grafana_bucket.id
  key      = each.value
  source   = "${path.module}/${each.value}"
}
