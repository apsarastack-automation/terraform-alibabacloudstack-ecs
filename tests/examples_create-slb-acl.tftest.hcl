run "validate" {
  command = apply
  module {
    source = "../examples/create-slb-acl"
  }
  variables {
    # name = 
  }
}