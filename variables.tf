variable "name" {
  default = "terraform-apsara-ecs-cluster"
}



variable "cpu_core_count" {
  description = "CPU core count used to fetch instance types."
  default     = 2
}

variable "memory_size" {
  description = "Memory size used to fetch instance types."
  default     = 4
}

variable "system_disk_size" {
  description = "The system disk size used to launch one or more ecs instances."
  type        = number
  default     = 40
}

variable "cluster_size" {
  description = "The number of ECS instances."
  default     = 1
}