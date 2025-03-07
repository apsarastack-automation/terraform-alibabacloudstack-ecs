
// Zones data source for availability_zone
data "alibabacloudstack_zones" "this" {
  available_resource_creation = "Instance"
  enable_details              = true
}



// ECS Disk Resource for Module
resource "alibabacloudstack_disk" "this" {
  availability_zone = data.alibabacloudstack_zones.this.zones[0].id
  name              = var.disk_count < 2 ? var.name : format("%s%s", var.name, format("%02d", count.index + 1))
  category          = var.category
  size              = var.size
  encrypted         = var.encrypted
  count             = var.disk_count
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}
