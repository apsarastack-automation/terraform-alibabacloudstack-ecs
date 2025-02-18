run "validate" {
  command = apply
  module {
    source = "../examples/create-ecs-instance-cluster"
  }
  variables {
    # zone_id = 
    # name = 
  }
}