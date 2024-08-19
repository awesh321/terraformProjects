resource "aws_instance" "aweinstance" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.awesg.id]

    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install nginx -y
        sudo service nginx start
        EOF

  
}