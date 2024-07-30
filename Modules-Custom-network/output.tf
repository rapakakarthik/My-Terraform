output "subnet" {
  value = aws_instance.shell.subnet_id
}

output "sg" {
  value = aws_instance.shell.security_groups
}