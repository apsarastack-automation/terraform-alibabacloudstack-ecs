
// ECS Disk Resource for Module
module "disk" {
  source   = "../../modules/disk"
  name     = var.name
  category = var.category
}