#DB instance 생성용도
#subnet은 data.tf에서 받은 내용으로 대입
#db parameter group의 경우, local에서 db instance 생성과 같이 비슷하게 작성한 후 main.tf에서 대입 할 예정
#flatten으로 designate/main.tf에서 받은 변수들을 지정 및 가공한다.
locals {
  db_instance = flatten([
    for k, v in var.db_instance : {
      name                       = k
      identifier                 = v.identifier
      engine                     = v.engine
      engine_version             = v.engine_version
      instance_class             = v.instance_class
      storage_type               = v.storage_type
      allocate_storage           = v.allocate_storage
      max_allocated_storage      = v.max_allocated_storage
      multi_az                   = v.multi_az
      publicly_accessible        = v.publicly_accessible
      port                       = v.port
      username                   = v.username
      password                   = v.password
      backup_retention_period    = v.backup_retention_period
      auto_minor_version_upgrade = v.auto_minor_version_upgrade
      copy_tags_to_snapshot      = v.copy_tags_to_snapshot
      skip_final_snapshot        = v.skip_final_snapshot
      # db_subnet_group_name        =               ""
      # parameter_group_name        =               ""
    }
  ])
}

#DB parameter group 생성 용도
#flatten으로 designate/main.tf에서 받은 변수들을 지정 및 가공한다.
locals {
  db_param = flatten([
    for k, v in var.db_param : {
      name                 = k
      param_name           = v.param_name
      param_family         = v.param_family
      character_set_client = v.character_set_client
      character_set_server = v.character_set_server
    }
  ])
}

#DB sg 생성
#flatten으로 designate/main.tf에서 받은 변수들을 지정 및 가공한다.
locals {
  db_sg = flatten([
    for k, v in var.db_sg : {
      name             = k
      type             = v.type
      from_port        = v.from_port
      to_port          = v.to_port
      protocol         = v.protocol
      cidr_blocks      = v.cidr_blocks
      ipv6_cidr_blocks = v.ipv6_cidr_blocks
      prefix_list_ids  = v.prefix_list_ids
      description      = v.description
    }
  ])
}