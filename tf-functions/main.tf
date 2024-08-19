terraform {
}

variable "string_list" {
  type = list(string)
  default = [ "awesh", "rathore", "love" ]
}

locals {
    value = "Hello world"
}

output "output" {
#   value = lower(local.value)
    #  value = upper(local.value)
    # value = startswith(local.value, "Hello")
    # value = split(" ", local.value)
    # value = length(var.string_list)
    # value = min(1,5,6,7,8,4)
    # value = join(":", var.string_list)
    value = contains(var.string_list, "awesh")
}