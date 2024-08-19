output "public_ip" {
    value = aws_instance.aweinstance.public_ip
}

output "nginxURL" {
  value = "http://${aws_instance.aweinstance.public_ip}"
}