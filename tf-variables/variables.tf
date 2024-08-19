variable "aws_instance_types" {
    description = "this is the the instance type which we are using to create ec2"
    type = string
    # default = "t2.micro"
}

variable "aws_volume" {
    type = object({
      v_size = number
      volume_type = string
    })

    default = {
      v_size = 30
      volume_type = "gp2"
    }
  
}

variable "additional_tags" {
  type = map(string)
  default = {}
}