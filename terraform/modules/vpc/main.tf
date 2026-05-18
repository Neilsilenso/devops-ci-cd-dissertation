# 1. Create the VPC (Virtual Private Cloud)
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-vpc"
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# 2. Create Internet Gateway (allows VPC to connect to internet)
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# 3. Create public subnet (resources here can have public IPs)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true  # EC2 instances get public IP automatically

  tags = {
    Name = "${var.project_name}-public-subnet"
    Type = "public"
  }
}

# 4. Create route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"          # All internet traffic
    gateway_id = aws_internet_gateway.main.id  # Send to internet gateway
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# 5. Associate route table with public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# 6. Create security group (firewall rules)
resource "aws_security_group" "app" {
  name        = "${var.project_name}-sg"
  description = "Security group for dissertation application"
  vpc_id      = aws_vpc.main.id

  # Allow SSH from anywhere (for learning - restrict in production)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  # Allow HTTP traffic on port 3000 (our Node.js app)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Node.js app port"
  }

  # Allow all outbound traffic (EC2 needs to download packages)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}
