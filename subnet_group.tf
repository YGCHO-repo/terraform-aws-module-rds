resource "aws_db_subnet_group" "this" {
  subnet_ids = data.aws_subnets.selected_subnet.ids
  name       = "${var.prefix}-rds-subnet-group"
}
