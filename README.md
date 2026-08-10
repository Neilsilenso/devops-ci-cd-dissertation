# DevOps CI/CD Pipeline with Infrastructure as Code on AWS

Automated software delivery pipeline reducing deployment time by 99% (from 3 hours to <1 minute) using GitHub Actions, Terraform, and Docker on AWS Free Tier.

## Architecture Overview

The system implements a fully automated GitOps workflow:
1. **Developer** pushes code to the `main` branch.
2. **GitHub Actions** triggers the CI pipeline:
   - Runs unit tests.
   - Executes Trivy vulnerability scanning.
   - Builds a multi-stage Docker image.
   - Pushes the image to AWS ECR tagged with the commit SHA.
3. **CD Deployment** automatically SSHs into the AWS EC2 instance, pulls the new image, and restarts the container.
4. **Monitoring** via AWS CloudWatch triggers SNS email alerts if CPU utilization exceeds 80%.

## Tech Stack

*   **Cloud:** AWS (EC2, VPC, ECR, S3, CloudWatch, SNS, IAM)
*   **IaC:** Terraform (Modular architecture with remote state locking)
*   **CI/CD:** GitHub Actions
*   **Containerization:** Docker (Multi-stage builds, non-root user)
*   **Application:** Node.js (Express)
*   **Security:** Trivy (Vulnerability scanning), GitHub Secrets

## Repository Structure

```text
.
├── .github/workflows/    # CI/CD pipeline definitions
── app/                  # Node.js application source & Dockerfile
├── terraform/            # Infrastructure as Code modules
│   ├── modules/          # Reusable VPC and EC2 modules
│   └── backend.tf        # Remote state configuration (S3 + DynamoDB)
└── docs/                 # Architecture diagrams and documentation
