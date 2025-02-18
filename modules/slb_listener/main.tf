
resource "alibabacloudstack_slb_listener" "default" {
  load_balancer_id          = var.load_balancer_id
  backend_port              = var.backend_port
  frontend_port             = var.frontend_port
  protocol                  = var.protocol
  bandwidth                 = var.bandwidth
  sticky_session            = var.sticky_session
  sticky_session_type       = var.sticky_session_type
  cookie_timeout            = var.cookie_timeout
  cookie                    = var.cookie
  health_check              = var.health_check
  health_check_domain       = var.health_check_domain
  health_check_uri          = var.health_check_uri
  health_check_connect_port = var.health_check_connect_port
  healthy_threshold         = var.healthy_threshold
  unhealthy_threshold       = var.unhealthy_threshold
  health_check_timeout      = var.health_check_timeout
  health_check_interval     = var.health_check_interval
  health_check_http_code    = var.health_check_http_code
  acl_status                = var.acl_status
  acl_type                  = var.acl_type
  acl_id                    = var.acl_id
}
