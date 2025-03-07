run "validate" {
  command = apply
  module {
    source = "../examples/create-ecs-disk"
  }
  variables {
    # name = 
    # category = 
  }
}