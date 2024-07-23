#############################Creating Outputs#######################################################

output "mypub-ip" {
  value = aws_instance.main.public_ip
}

output "mypvt-ip" {
  value     = aws_instance.main.private_ip
  sensitive = true
}

