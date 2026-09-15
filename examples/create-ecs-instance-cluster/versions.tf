terraform {
  required_version = ">= 0.13"
  required_providers {
    alibabacloudstack = {
      source  = "aliyun/alibabacloudstack"
      version = ">= 3.18.28, < 3.19.0"
    }
  }
}