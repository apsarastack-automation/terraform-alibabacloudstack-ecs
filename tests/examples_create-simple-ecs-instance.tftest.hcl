run "validate" {
  command = apply
  module {
    source = "../examples/create-simple-ecs-instance"
  }
  variables {
    # name = 
    # description = 
    # cidr_block = 
    # image_id = 
    # image_name_regex = 
    # instance_type = 
    # host_name = 
    # password = 
    # kms_encrypted_password = 
    # kms_encryption_context = 
    # system_disk_category = 
    # system_disk_size = 
    # private_ip = 
    # internet_max_bandwidth_out = 
    # associate_public_ip_address = 
    # instance_charge_type = 
    # user_data = 
    # role_name = 
    # key_name = 
    # security_enhancement_strategy = 
    # subscription = 
    # tags = 
  }
}