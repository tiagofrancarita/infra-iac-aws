output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.example_db.endpoint
}