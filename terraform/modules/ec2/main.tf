resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true  # Gets public IP for SSH/app access
  
  # Install Docker on boot (user_data script runs as root)
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              # Add ubuntu user to docker group (no sudo needed)
              usermod -aG docker ubuntu
              # Start docker service
              systemctl enable docker
              systemctl start docker
              EOF
  
  # Root block device (8GB GP2 = Free Tier eligible)
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }
  
  tags = {
    Name        = "${var.project_name}-ec2"
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
    Role        = "app-server"
  }
}
