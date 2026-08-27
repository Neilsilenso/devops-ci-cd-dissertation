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

- **Cloud:** AWS (EC2, VPC, ECR, S3, CloudWatch, SNS, IAM)
- **IaC:** Terraform (Modular architecture with remote state locking)
- **CI/CD:** GitHub Actions
- **Containerization:** Docker (Multi-stage builds, non-root user)
- **Application:** Node.js (Express)
- **Security:** Trivy (Vulnerability scanning), GitHub Secrets

## Repository Structure

```text
.
├── .github/workflows/    # CI/CD pipeline definitions
├── app/                  # Node.js application source & Dockerfile
├── terraform/            # Infrastructure as Code modules
│   ├── modules/          # Reusable VPC and EC2 modules
│   └── backend.tf        # Remote state configuration (S3 + DynamoDB)
└── docs/                 # Architecture diagrams and documentation
```

## Prerequisites

- AWS Account with Free Tier eligibility
- Terraform v1.5+
- Docker Desktop
- GitHub Account
- Node.js v20+ (for local development)

## Deployment Instructions

### 1. Infrastructure Provisioning
Navigate to the terraform directory and initialize the backend:
```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```
*Note: Ensure AWS credentials are configured in your environment or via `aws configure`.*

### 2. Application Deployment
The application deploys automatically upon pushing to the `main` branch. 
To trigger manually, update the `app/app.js` file and push:
```bash
git add app/app.js
git commit -m "feat: update application"
git push origin main
```

### 3. Verification
Once the pipeline completes (approx. 60 seconds), verify the deployment:
```bash
curl http://<EC2_PUBLIC_IP>:3000/health
```

## Security & Cost Optimization

- **Zero Cost:** All resources (t3.micro EC2, S3, ECR) are strictly within AWS Free Tier limits.
- **Least Privilege:** IAM users are restricted to specific ECR and EC2 actions.
- **Secrets Management:** AWS credentials and SSH keys are stored in GitHub Encrypted Secrets.
- **Vulnerability Scanning:** Integrated Trivy scanner blocks builds with Critical/High vulnerabilities.

## License

This project is licensed under the MIT License. See the (LICENSE) file for details.
```
License is added for this project
