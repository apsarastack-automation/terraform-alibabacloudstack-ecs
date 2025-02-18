variable "name" {
  description = "the Name of the access control list."
}

variable "ip_version" {
  description = "The IP Version of access control list is the type of its entry (IP addresses or CIDR blocks). It values ipv4/ipv6. Our plugin provides a default ip_version: ipv4."
  default     = "ipv4"
}