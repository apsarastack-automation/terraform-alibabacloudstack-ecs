module "default" {
  source = "./modules/ecs_instance_cluster"
  name = var.name
  cpu_core_count = var.cpu_core_count
  memory_size = var.memory_size
  system_disk_size = var.system_disk_size
  cluster_size= var.cluster_size
}