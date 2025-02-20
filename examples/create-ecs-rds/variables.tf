variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "iac-tf-ecs-instance"
}

variable "availability_zone" {
  description = "The available zone to launch ecs instance and other resources."
  default     = ""
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = "tf-ecs-instance-description"
}

variable "image_id" {
  description = "The image id used to launch one or more ecs instances."
  type        = string
  default     = ""
}

variable "image_name_regex" {
  description = "The regex string used to search image launch one or more ecs instances."
  type        = string
  default     = "^ubuntu_"
}

variable "instance_type" {
  description = "The instance type used to launch one or more ecs instances."
  type        = string
  default     = ""
}

variable "disk_category" {
  description = "The specification of the disk category."
  type        = string
  default     = ""
}

variable "host_name" {
  description = "Host name used on all instances as prefix. Like if the value is TF-ECS-Host-Name and then the final host name would be TF-ECS-Host-Name001, TF-ECS-Host-Name002 and so on."
  type        = string
  default     = "iac-tf-ecs-instance-host"
}

variable "engine" {
  description = "The specification of the engine."
  type        = string
  default     = "MySQL"
}

variable "engine_version" {
  description = "The specification of the engine version."
  type        = string
  default     = "5.7"
}

variable "rds_instance_type" {
  description = "The specification of the rds instance type."
  type        = string
  default     = "rds.mysql.t1.small"
}

variable "instance_storage" {
  description = "The specification of the instance storage."
  type        = string
  default     = "30"
}

variable "instance_charge_type" {
  description = "The specification of the instance charge type."
  type        = string
  default     = "Postpaid"
}

variable "monitoring_period" {
  description = "The specification of the monitoring period."
  type        = string
  default     = "60"
}

variable "rds_disk_category" {
  description = "The specification of the database disk category."
  type        = string
  default     = ""
}

variable "password" {
  description = "The password of instance."
  type        = string
  default     = "YourPassword123"
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to an instance. It is conflicted with 'password'."
  type        = string
  default     = ""
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

variable "user_data" {
  description = "User data to pass to instance on boot."
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of SSH key pair that can login ECS instance successfully without password. If it is specified, the password would be invalid."
  type        = string
  default     = ""
}

variable "security_enhancement_strategy" {
  description = "The security enhancement strategy."
  type        = string
  default     = "Active"
}