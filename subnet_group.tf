resource "aws_db_subnet_group" "subnet_group" {
  name       = var.aws_rds_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_tag_name
  }
}
