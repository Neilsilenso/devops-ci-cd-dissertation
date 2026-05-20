variable "project_name" {
  description = "Name of the project (used for resource tags)"
  type        = string
  default     = "devops-dissertation"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"  # Free Tier eligible
}

variable "ami_id" {
  description = "Amazon Machine Image ID (Ubuntu 22.04 LTS)"
  type        = string
  default     = "ami-00403f401ee6a4b98"  # Ubuntu 22.04 LTS in us-east-1
}
