resource "aws_db_parameter_group" "this" {
    for_each = { for i in local.db_param : i.name => i }

    name     = each.value.name
    family   = each.value.param_family

    parameter {
      name   = "character_set_client"
      value  = each.value.character_set_client
    }

    parameter {
      name   = "character_set_server"
      value  = each.value.character_set_server
    }
}