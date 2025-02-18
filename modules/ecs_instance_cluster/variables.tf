variable "name" {
  default = "terraform-apsara-ecs-cluster"
}

variable "availability_zone" {
  description = "The available zone to launch ecs instance and other resources."
  default     = ""
}

# Image variables
variable "image_id" {
  description = "The image id used to launch ecs instances. If not set, a system image with `image_name_regex` will be returned."
  default     = ""
}

variable "image_name_regex" {
  description = "The ECS image's name regex used to fetch specified image."
  default     = "^ubuntu_18.*_64"
}

variable "vpc_id" {
  description = "The vpc id used to launch ecs instances. If not set, will create a new one."
  default     = ""
}

variable "vswtich_id" {
  description = "The vswitch id used to launch ecs instances. If not set, will create a new one."
  default     = ""
}

# Instance typs variables
variable "instance_type" {
  description = "The instance type used to launch ecs instances. If not set, a random type with `cpu_core_count` and `memory_size` will be returned."
  default     = ""
}

variable "cpu_core_count" {
  description = "CPU core count used to fetch instance types."
  default     = 2
}

variable "memory_size" {
  description = "Memory size used to fetch instance types."
  default     = 4
}

# VSwitch  ID
variable "vswitch_id" {
  description = "The existing VSwitch ID. If not set, a new vswitch will be created."
  default     = ""
}

# Security Group variables
variable "security_group_ids" {
  description = "List of security group ids used to create ECS instances. If not set, a new one will be created."
  type        = list(string)
  default     = []
}

# Key pair variables
variable "key_name" {
  description = "The key pair name used to config instances."
  default     = ""
}

variable "password" {
  description = "The password of instance."
  default     = ""
}

variable "instance_tags" {
  description = "Used to mark specified ecs instance."
  type        = map(string)

  default = {
    created_by   = "Terraform"
    created_from = "module-ecs-instance-cluster"
  }
}

variable "cluster_size" {
  description = "The number of ECS instances."
  default     = 3
}

variable "user_data" {
  description = "User data to pass to instance on boot"
  default     = ""
}

variable "disk_category" {
  description = "The system disk category used to launch one or more ecs instances."
  type        = string
  default     = ""
}