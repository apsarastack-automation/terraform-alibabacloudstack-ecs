variable "load_balancer_id" {
  description = "The Load Balancer ID which is used to launch a new listener."
  type        = string
  default     = ""
}

variable "backend_port" {
  description = "Port used by the Server Load Balancer instance backend."
  type        = number
  default     = 80
}

# Load Balancer Instance variables
variable "frontend_port" {
  description = "Port used by the Server Load Balancer instance frontend."
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol to listen on. "
  type        = string
  default     = "http"
}

variable "bandwidth" {
  description = "Bandwidth peak of Listener. "
  type        = number
  default     = 10
}

variable "sticky_session" {
  description = "Whether to enable session persistence, Valid values are on and off. Default to off."
  type        = string
  default     = "on"
}

variable "sticky_session_type" {
  description = "Mode for handling the cookie. "
  type        = string
  default     = "insert"
}

variable "cookie_timeout" {
  description = " Cookie timeout."
  type        = number
  default     = 86400
}

variable "cookie" {
  description = "The cookie configured on the server. "
  type        = string
  default     = "testslblistenercookie"
}

variable "health_check" {
  description = " Whether to enable health check."
  type        = string
  default     = "on"
}

variable "health_check_domain" {
  description = "Domain name used for health check."
  type        = string
  default     = "ali.com"
}

variable "health_check_uri" {
  description = " URI used for health check. "
  type        = string
  default     = "/cons"
}

variable "health_check_connect_port" {
  description = "Port used for health check."
  type        = number
  default     = 20
}

variable "healthy_threshold" {
  description = "Threshold determining the result of the health check is success."
  type        = number
  default     = 8
}

variable "unhealthy_threshold" {
  description = "Threshold determining the result of the health check is fail."
  type        = number
  default     = 8
}

variable "health_check_timeout" {
  description = "Maximum timeout of each health check response."
  type        = number
  default     = 8
}

variable "health_check_interval" {
  description = " Time interval of health checks."
  type        = number
  default     = 5
}

variable "health_check_http_code" {
  description = " Regular health check HTTP status code."
  type        = string
  default     = "http_2xx,http_3xx"
}

variable "acl_status" {
  description = "Whether to enable acl(access control list), the acl is specified by acl_id. Valid values are on and off. Default to off."
  type        = string
  default     = "on"
}

variable "acl_type" {
  description = " Mode for handling the acl specified by acl_id."
  type        = string
  default     = "white"
}

variable "acl_id" {
  description = " Port used for health check."
  type        = string
  default     = 20
}