resource "aws_db_instance" "this" {
    for_each = { for i in local.db_instance : i.name => i }

    identifier                   = each.value.identifier

    engine                       = each.value.engine
    engine_version               = each.value.engine_version

    instance_class               = each.value.instance_class
    storage_type                 = each.value.storage_type
    allocated_storage            = each.value.allocate_storage
    max_allocated_storage        = each.value.max_allocated_storage


    db_subnet_group_name         = aws_db_subnet_group.this.name
    publicly_accessible          = each.value.publicly_accessible  
    port                         = each.value.port
    vpc_security_group_ids       = aws_security_group.this[*].id  

    db_name                      = each.value.name
    username                     = each.value.username
    password                     = each.value.password

    parameter_group_name         = aws_db_parameter_group.this[each.key].name

    backup_retention_period      = each.value.backup_retention_period
    auto_minor_version_upgrade   = each.value.auto_minor_version_upgrade
    
    copy_tags_to_snapshot        = each.value.copy_tags_to_snapshot  
    skip_final_snapshot          = each.value.skip_final_snapshot 

    tags                         = merge(var.tags, tomap({ "env" = each.key }))
}