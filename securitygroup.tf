resource "aws_security_group" "this" {
  name        = "${var.prefix}-rds-sg"
  description = "${var.prefix} Security Group"
  vpc_id      = data.aws_vpc.selected_vpc.id

  tags = merge(var.tags, tomap({ Name = format("%s-rds-sg", var.prefix) }))
}



resource "aws_security_group_rule" "this" {
  security_group_id = aws_security_group.this.id
  for_each          = { for i in local.db_sg : i.name => i }

  type             = each.value.type
  from_port        = each.value.from_port
  to_port          = each.value.to_port
  cidr_blocks      = each.value.cidr_blocks
  ipv6_cidr_blocks = each.value.ipv6_cidr_blocks
  protocol         = each.value.protocol
  prefix_list_ids  = each.value.prefix_list_ids
  description      = each.value.description

  depends_on = [
    aws_security_group.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}