# Terraform ECS 集群模块说明文档

## 模块概述
本模块用于在阿里云上快速创建弹性计算服务（ECS）实例集群，包含以下核心功能：
- 自动创建/复用VPC网络
- 自动创建/复用VSwitch子网
- 自动配置安全组规则
- 批量创建指定规格的ECS实例
- 可选创建弹性公网IP(EIP)

## 快速开始

```hcl
module "web_cluster" {
  source = "./modules/ecs_instance_cluster"

  # 基础配置
  name             = "production-web"
  cluster_size     = 5
  
  # 实例规格
  cpu_core_count   = 4
  memory_size      = 8
  system_disk_size = 50
  
  # 镜像配置
  image_name_regex = "^centos_7_04_64_20G_alibase"
}
```

| 变量名 | 类型 | 默认值 | 描述 |
| --- | --- | --- | --- |
| name | string | "terraform-apsara-ecs-cluster" | 资源统一命名前缀 |
| cluster_size | number | 3 | 集群实例数量 |
| cpu_core_count | number | 2 | 每实例vCPU核数 |
| memory_size | number | 4 | 每实例内存大小(GB) |
| system_disk_size | number | 40 | 系统盘容量(GB) |
| image_name_regex | string | "^ubuntu_18.*_64" | 操作系统镜像名称正则表达式 |

### 资源架构
1. VPC网络 (alibabacloudstack_vpc.default)

2. VSwitch子网 (alibabacloudstack_vswitch.this)

3. 安全组 (alibabacloudstack_security_group.default)

4. ECS实例组 (alibabacloudstack_instance.default)

5. 弹性公网IP (alibabacloudstack_eip.default)


### 注意事项

1. 命名规范

  - 所有资源名称以name变量为前缀
  - 集群实例自动添加序号后缀（如web-cluster-001）