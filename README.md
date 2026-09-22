# Automated CI/CD Pipeline with Infrastructure as Code on AWS

**A production-grade, zero-cost DevOps automation project built for enterprise software delivery.** 

This repository contains the complete source code, Infrastructure as Code (IaC) scripts, and CI/CD pipeline configuration. 

The project solves a critical enterprise bottleneck: **reducing manual, error-prone deployment cycles from 3 hours to just 62 seconds**, while maintaining a strict **\$0.00 monthly cloud cost** by leveraging the AWS Free Tier.

---

##  Key Achievements & Metrics

- **99% Reduction in Deployment Time:** From 3 hours (manual) to 62 seconds (automated).
- **Zero Cloud Expenditure:** Entire architecture runs strictly within AWS Free Tier limits.
- **100% Pipeline Success Rate:** Fully automated, version-controlled, and repeatable.
- **Shift-Left Security:** Zero critical/high vulnerabilities via pre-build Trivy scanning.

---

##  Tech Stack

| Category | Technologies |
| :--- | :--- |
| **Cloud Provider** | AWS (EC2, VPC, S3, ECR, IAM, CloudWatch, SNS, DynamoDB) |
| **Infrastructure as Code** | Terraform |
| **CI/CD & Version Control** | GitHub Actions, Git |
| **Containerization** | Docker (Multi-stage builds) |
| **Security & Monitoring** | Trivy, AWS CloudWatch, AWS SNS |
| **Application Runtime** | Node.js, Express.js |
| **Operating System** | Ubuntu 22.04 LTS |

---

##  Architecture & Pipeline Workflow

The system is divided into two core components: **Infrastructure Provisioning** and **Automated Deployment**.

### 1. Infrastructure as Code (Terraform)
Provisions the entire AWS environment declaratively:
- Isolated VPC, Public Subnet, and Internet Gateway.
- EC2 `t3.micro` instance with automated Docker installation via user-data.
- Remote Terraform state stored in **S3** with **DynamoDB** state locking to prevent concurrent modifications.

### 2. Four-Stage CI/CD Pipeline (GitHub Actions)
Triggered automatically on every push to the `main` branch:
1. **Build & Test:** Checks out code, installs Node.js dependencies, and runs unit tests.
2. **Security Scan:** Runs **Trivy** to scan the filesystem for CRITICAL/HIGH CVEs before building.
3. **Build & Push:** Builds a multi-stage Docker image, tags it with the commit SHA, and pushes to Amazon ECR.
4. **Deploy to EC2:** Connects via SSH, pulls the new image from ECR, and restarts the container.

---

##  Security & Observability

- **Least Privilege IAM:** The GitHub Actions IAM user is scoped strictly to ECR push and EC2 describe actions.
- **Secrets Management:** All AWS credentials and SSH keys are stored as encrypted GitHub Secrets.
- **Non-Root Containers:** Docker containers run as a non-root `node` user to minimize the attack surface.
- **Proactive Monitoring:** AWS CloudWatch triggers an alarm if CPU utilization exceeds 80%, instantly sending an email alert via AWS SNS.

---

##  Repository Structure

```text
.
├── .github/workflows/          # GitHub Actions CI/CD pipeline
│   └── ci.yml                  # Main pipeline configuration
├── app/                        # Node.js application
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── app.js
│   └── package.json
├── docs/                       # Documentation
│   └── architecture-diagram.png
├── terraform/                  # Infrastructure as Code
│   ├── modules/
│   │   ├── ec2/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc/
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── .terraform.lock.hcl
│   ├── backend.tf              # S3 + DynamoDB state backend
│   ├── main.tf                 # Root module configuration
│   ├── providers.tf            # AWS provider configuration
│   └── variables.tf            # Input variables
├── monitoring/                 # CloudWatch & SNS configurations
├── scripts/                    # Automation scripts
├── .gitignore
├── LICENSE
└── README.md
```

---

##  How to Reproduce

This project is fully reproducible. To deploy this infrastructure in your own AWS account:

### 1. Clone the repository
```bash
git clone https://github.com/Neilsilenso/aws-cicd-terraform-pipeline.git
cd aws-cicd-terraform-pipeline
```

### 2. Configure AWS credentials and state backend
- Create an S3 bucket for Terraform state.
- Create a DynamoDB table for state locking.

### 3. Initialize and apply Terraform
```bash
cd terraform
terraform init
terraform apply
```

### 4. Add credentials to GitHub Repository Secrets
Go to your repository → **Settings** → **Secrets and variables** → **Actions** and add the following secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `SSH_PRIVATE_KEY` *(your EC2 SSH private key)*
- `EC2_HOST` *(your EC2 instance public IP or DNS)*

### 5. Push a commit to trigger the pipeline
```bash
git add .
git commit -m "Initial commit"
git push origin main
```
The GitHub Actions pipeline will automatically build, test, scan, and deploy your application!

---

##  Connect

- **GitHub:** [Neilsilenso](https://github.com/Neilsilenso)
- **LinkedIn:** [connectwithaswin-c](https://linkedin.com)

---

##  License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

*Built by Aswin C*
