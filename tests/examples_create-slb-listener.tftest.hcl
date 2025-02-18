run "validate" {
  command = apply
  module {
    source = "../examples/create-slb-listener"
  }
  variables {
    # name = 
  }
}