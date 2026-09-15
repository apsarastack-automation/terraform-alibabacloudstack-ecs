# Terraform ECS Cluster Module Documentation

## Module Overview
This Terraform module creates an ECS instance cluster on Alibaba Cloud with the following resources:
- 1 VPC network (optional)
- 1 VSwitch subnet (optional)
- 1 Security Group (optional)
- N ECS instances (configurable quantity)
- 2 EIP addresses (optional)

## Usage Example

```hcl
module "web_cluster" {
  source = "./modules/ecs_instance_cluster"

  # Customizable parameters:
  name             = "production-web"
  cluster_size     = 5
  
  cpu_core_count   = 4
  memory_size      = 8
  system_disk_size = 50
}
```

### Input Variables

| Variable Name | Type | Default Value | Description |
|---------------|------|---------------|-------------|
| `name` | string | `"terraform-apsara-ecs-cluster"` | Unified naming prefix for resources |
| `cluster_size` | number | `3` | Number of cluster instances |
| `cpu_core_count` | number | `2` | vCPU cores per instance |
| `memory_size` | number | `4` | Memory size per instance (GB) |
| `system_disk_size` | number | `40` | System disk capacity (GB) |

### Resource Architecture
1. **VPC Network** (`alibabacloudstack_vpc.default`)  
2. **VSwitch Subnet** (`alibabacloudstack_vswitch.this`)  
3. **Security Group** (`alibabacloudstack_security_group.default`)  
4. **ECS Instance Cluster** (`alibabacloudstack_instance.default`)  
5. **Elastic Public IP** (`alibabacloudstack_eip.default`)  

### Important Notes

1. **Naming Convention**  
   • All resources use the `name` variable as prefix  
   • Cluster instances automatically append sequential suffixes (e.g., `web-cluster-001`)