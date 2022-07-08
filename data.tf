data "aws_vpc" "selected_vpc" {
    dynamic "filter" {
        for_each = var.vpc_filter
        iterator = tag

        content {
            name = "tag:${tag.key}"
            values = [
                tag.value
            ]
        }
    }
}

data "aws_subnets" "selected_subnet" {    
    filter {
        name = "tag:Name"
        values = ["*-private-rds-subnet"]
    }
}

data "aws_security_groups" "selected_sg" {
    filter {
        name = "tag:CreatedByTerraform"
        values = ["true"]
    }
}




