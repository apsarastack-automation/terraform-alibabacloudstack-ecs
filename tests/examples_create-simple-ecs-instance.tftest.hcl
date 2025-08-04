run "validate" {
  command = apply
  module {
    source = "./examples/create-simple-ecs-instance"
  }
  variables {
    # name = 
    # availability_zone = 
    # description = 
    # image_id = 
    # image_name_regex = 
    # instance_type = 
    # host_name = 
    # password = 
    # kms_encrypted_password = 
    # kms_encryption_context = 
    # system_disk_category = 
    # system_disk_size = 
    # user_data = 
    # key_name = 
    # security_enhancement_strategy = 
  }
}