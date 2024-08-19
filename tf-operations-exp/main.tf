terraform {
}

#nuber list

variable "number_list" {
  type = list(number)
  default = [ 1,2,3,4,5,6,7 ]
}

variable "person_name" {
    type = list(object({
      fname = string
      lname =string
    }))
    default = [ {
      fname = "awesh"
      lname = "rathore"
    }, {
        fname = "rahul"
        lname = "sharma"
    } ]
}

variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three" = 3
    }
}

locals {
  sum = 2 + 2
  mul = 2 * 2

  #double the list
  double = [for i in var.number_list : i*2]
  odd = [for i in var.number_list : i if i%2!=0 ]

  #first name of persons only
  fname = [for p in var.person_name: p.fname]

  map_info = [for key, value in var.map_list: key]

  double_value = {for key, value in var.map_list: key => value * 2}
  
}

# output "mul" {
#   value = local.mul
# }

# output "sum" {
#   value = local.sum
# }

output "output" {
  value = local.double_value
}
