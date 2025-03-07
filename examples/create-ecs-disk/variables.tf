variable "name" {
  description = "Name used on all disks as prefix. Like TF_ECS_Disk-1, TF_ECS_Disk-2."
  default     = "TF_ECS_Disk"
}

variable "category" {
  description = "The data disk category used to launch one or more data disks.such as cloud_efficiency,cloud_pperf"
  default     = "cloud_pperf"
}