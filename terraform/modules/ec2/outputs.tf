output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.app.public_ip
}

output "public_dns" {
  description = "Public DNS name of EC2 instance"
  value       = aws_instance.app.public_dns
}

output "private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.app.private_ip
}
