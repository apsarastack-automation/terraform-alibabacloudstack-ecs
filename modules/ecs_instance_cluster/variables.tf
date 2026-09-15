variable "name" {
  default = "terraform-apsara-ecs-cluster"
}

variable "availability_zone" {
  description = "The available zone to launch ecs instance and other resources."
  default     = ""
}

# Image variables
variable "image_id" {
  description = "The image id used to launch ecs instances. If not set, the most recent system image will be returned."
  default     = ""
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = "tf-ecs-instance-description"
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

variable "role_name" {
  description = "Instance RAM role name. The name is provided and maintained by RAM. You can use 'alibabacloudstack_ram_role' to create a new one."
  type        = string
  default     = ""
}

# Key pair variables
variable "key_name" {
  description = "The key pair name used to config instances."
  default     = ""
}

variable "host_name" {
  description = "Host name used on all instances as prefix. Like if the value is TF-ECS-Host-Name and then the final host name would be TF-ECS-Host-Name001, TF-ECS-Host-Name002 and so on."
  type        = string
  default     = "iac-tf-ecs-instance-host"
}

variable "password" {
  description = "The password of instance."
  type        = string
  default     = ""
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to an instance. It is conflicted with 'password'."
  type        = string
  default     = ""
}

variable "security_enhancement_strategy" {
  description = "The security enhancement strategy."
  type        = string
  default     = "Active"
}

variable "kms_encryption_context" {
  description = "An KMS encryption context used to decrypt 'kms_encrypted_password' before creating or updating an instance with 'kms_encrypted_password'."
  type        = map(string)
  default     = {}
}

variable "system_disk_size" {
  description = "The system disk size used to launch one or more ecs instances."
  type        = number
  default     = 40
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
  default     = 1
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