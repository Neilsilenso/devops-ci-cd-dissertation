# DevOps CI/CD Dissertation Project
## BITS Pilani - B.Tech Information Systems  
### Design and Implementation of a CI/CD Pipeline with Infrastructure as Code for Automated Cloud Deployment on AWS

Status	: In Progress (May-Aug 2026)  
Tools	: Terraform, Docker, GitHub Actions, AWS (EC2/ECS), CloudWatch  
Goal	: Zero-cost, portfolio-ready DevOps automation project

##  Repository Structure

├── app/ # Node.js application source
├── terraform/ # Infrastructure as Code (IaC)
│ ├── modules/ # Reusable Terraform modules
│ │ ├── vpc/ # Virtual Private Cloud
│ │ ├── ec2/ # EC2 instances
│ │ ├── ecr/ # Container Registry
│ │ └── ecs/ # Container Service
│ └── backend.tf # Remote state (S3 + DynamoDB)
├── .github/workflows/ # GitHub Actions CI/CD pipelines
├── docs/ # Dissertation documents & diagrams
├── scripts/ # Utility scripts
└── monitoring/ # CloudWatch dashboards & alerts


## Dissertation Details
- Research Area	: Introduction to DevOPS (Primary), Cloud Computing (Secondary)
- Timeline	: May 12 - August 17, 2026 (14 weeks)
- Deliverables	: Working CI/CD pipeline + Dissertation report + Portfolio repo

## Quick Start
1. Clone this repository
2. Configure AWS credentials
3. Run `terraform init` in `terraform/` directory
4. Follow weekly progress in `docs/progress-log.md`

## Weekly Progress
See [Progress Log](docs/progress-log.md)

## Dissertation Chapters
- [Chapter 1: Introduction](docs/dissertation-chapters/chapter-1-introduction.md)
- Chapter 2: Literature Review (Coming soon)
- Chapter 3: System Design (Coming soon)
- Chapter 4: Implementation (Coming soon)
- Chapter 5: Testing & Results (Coming soon)
- Chapter 6: Conclusion (Coming soon)
