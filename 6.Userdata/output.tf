output "pub-ip" {
  value = aws_instance.chess.public_ip
}

output "pvt-ip" {
  value     = aws_instance.chess.private_ip
  sensitive = true

}