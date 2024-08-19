ec2_config = [ {
  ami = "ami-0a4408457f9a03be3" # amazon
  instance_type = "t2.micro"
}, {
    ami = "ami-0ad21ae1d0696ad58" #ubuntu
    instance_type = "t2.micro"
} ]

ec2-map = {
  "amazon" = {
    ami = "ami-0a4408457f9a03be3" # amazon
    instance_type = "t2.micro"
  },
  "ubuntu" = {
    ami = "ami-0ad21ae1d0696ad58" #ubuntu
    instance_type = "t2.micro"
  }
}