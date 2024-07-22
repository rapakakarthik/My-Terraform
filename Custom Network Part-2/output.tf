output "dev-public-ip" {
  value = aws_instance.dev.public_ip

}

output "linux-pub-ip" {
  value = aws_instance.helm.public_ip

}
output "linux-pvt-ip" {
  value     = aws_instance.helm.private_ip
  sensitive = true

}

output "test-public-ip" {
  value = aws_instance.test.public_ip

}