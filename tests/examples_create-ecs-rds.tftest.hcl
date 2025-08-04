run "validate" {
  command = apply
  module {
    source = "./examples/create-ecs-rds"
  }
  variables {
    # name = 
    # availability_zone = 
    # description = 
    # image_id = 
    # image_name_regex = 
    # instance_type = 
    # disk_category = 
    # host_name = 
    # engine = 
    # engine_version = 
    # rds_instance_type = 
    # instance_storage = 
    # instance_charge_type = 
    # monitoring_period = 
    # rds_disk_category = 
    # password = 
    # kms_encrypted_password = 
    # kms_encryption_context = 
    # system_disk_size = 
    # user_data = 
    # key_name = 
    # security_enhancement_strategy = 
  }
}