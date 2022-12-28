resource "aws_db_subnet_group" "this" {
<<<<<<< HEAD
  subnet_ids = data.aws_subnets.selected_subnet.ids
  name       = "${var.prefix}-rds-subnet-group"
}
=======
    subnet_ids = data.aws_subnets.selected_subnet.ids
    name = "${var.prefix}-rds-subnet-group"
    
}
>>>>>>> 5ff9e3f034ddfbaa06426fdad7bf1b43c3e9b5de
