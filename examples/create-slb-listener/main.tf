
resource "alibabacloudstack_slb_loadbalancer" "default" {
  name         = var.name
  address_type = "internet"
}



module "slb_acl" {
  source     = "../../modules/slb_acl"
  name       = var.name
  ip_version = "ipv4"
}


module "slb_listener" {
  source           = "../../modules/slb_listener"
  acl_id           = module.slb_acl.slb_acl_id
  load_balancer_id = alibabacloudstack_slb_loadbalancer.default.id
}