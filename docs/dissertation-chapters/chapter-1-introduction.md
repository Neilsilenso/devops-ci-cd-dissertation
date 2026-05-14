# Chapter 1: Introduction

## 1.1 Purpose of the Work and Expected Outcome
The primary purpose of this dissertation is to design, implement, and evaluate a fully automated Continuous Integration and Continuous Deployment (CI/CD) pipeline integrated with Infrastructure as Code (IaC) principles for deploying containerized applications on Amazon Web Services (AWS). 

This work addresses a critical gap observed in traditional IT support environments: the reliance on manual, error-prone deployment processes executed via AWS Console or ad-hoc scripts. By implementing a reproducible, version-controlled, and automated software delivery system, this project aims to:

1. Eliminate manual infrastructure provisioning through Terraform-based Infrastructure as Code
2. Automate application testing and deployment via GitHub Actions CI/CD pipelines
3. Ensure environment consistency across development, staging, and production using containerization
4. Provide measurable improvements in deployment frequency, lead time, and failure recovery
5. Demonstrate cost-conscious cloud engineering practices using AWS Free Tier resources

### Expected Outcomes
| Outcome | Metric/Description |
|---------|-------------------|
| Automated CI/CD Pipeline | GitHub Actions workflow triggering on code push, with automated testing and deployment to AWS |
| Infrastructure as Code | Terraform modules provisioning VPC, compute, networking, and monitoring resources |
| Containerized Application | Node.js REST API packaged in Docker, deployed to AWS ECS (EC2 launch type for Free Tier) |
| Monitoring & Alerting | CloudWatch dashboards and SNS email alerts for system health and cost thresholds |
| Cost Control | AWS Budgets alerts + exclusive use of Free Tier-eligible resources during development |
| Academic Deliverable | BITS-compliant dissertation report with architecture, implementation, and evaluation |
| Portfolio Asset | Public GitHub repository demonstrating end-to-end DevOps skills for job interviews |

## 1.2 Literature Review (Summary)
DevOps practices have transformed software delivery by bridging development and operations. According to the DORA State of DevOps Report (2022), high-performing organizations deploy 208x more frequently and recover from incidents 106x faster than low performers.

Key enabling technologies for this dissertation:
- Infrastructure as Code (IaC): Terraform allows declarative definition of cloud resources, enabling version control, peer review, and reproducible environments (Morris, 2020).
- Containerization: Docker packages applications with dependencies into portable units, solving the "works on my machine" problem (Fowler, 2006).
- CI/CD Automation: GitHub Actions provides serverless workflow automation with native GitHub integration, reducing deployment failures by up to 60% (GitHub Docs, 2023).
- Cloud Orchestration: AWS ECS with EC2 launch type provides container management while remaining within Free Tier limits, offering a practical learning path before advancing to serverless Fargate.

## 1.3 Existing Process and Its Limitations
In my current role as a Unix + Cloud Consultant supporting enterprise clients, I observe that traditional IT support workflows suffer from:

| Limitation | Impact |
|-----------|--------|
| Manual AWS Console provisioning | Time-consuming, error-prone, no audit trail |
| Ad-hoc SSH deployments | No automated testing, inconsistent environments |
| No version control for infrastructure | Configuration drift, difficult rollbacks |
| Inconsistent monitoring setup | Blind spots during incidents |
| Tribal knowledge documentation | Slow onboarding, knowledge loss |

These limitations result in slow deployment cycles (hours vs. minutes), frequent configuration-related outages, and high cognitive load on support engineers.

## 1.4 Justification for the Chosen Methodology
This dissertation adopts a practical, implementation-first methodology structured around the DevOps toolchain with highest industry adoption:

| Tool | Why Selected |
|------|-------------|
| Terraform | Cloud-agnostic, large community, explicitly requested in DevOps job descriptions |
| GitHub Actions | Zero infrastructure overhead, native GitHub integration, YAML-based simplicity |
| Docker | Industry-standard containerization, portable across environments |
| AWS ECS (EC2 launch type) | Free Tier eligible, teaches fundamentals before advancing to Fargate |
| CloudWatch | Native AWS monitoring, integrates seamlessly with other services |

The iterative, weekly milestone approach mirrors real-world Agile sprints, ensuring each week produces a tangible, testable deliverable.

## 1.5 Dissertation Structure
- Chapter 2: Literature Review – DevOps concepts, IaC, CI/CD, containerization research
- Chapter 3: System Design – Architecture diagrams, tool selection rationale, security model
- Chapter 4: Implementation – Terraform modules, Dockerfile, GitHub Actions workflows
- Chapter 5: Testing & Results – Pipeline metrics, cost analysis, reliability evaluation
- Chapter 6: Conclusion & Future Work – Summary, limitations, migration path to ECS Fargate/Kubernetes

## 1.6 Scope and Limitations
### In Scope 
- AWS Free Tier-eligible resources only (t3.micro EC2, standard S3, basic CloudWatch)
- Single-region deployment (us-east-1)
- Simple Node.js REST API with health check + CRUD endpoints
- GitHub Actions for CI/CD (no self-hosted runners)
- Terraform for infrastructure provisioning with remote state (S3 + DynamoDB)

### Out of Scope 
- Multi-region high availability (covered in future work)
- Kubernetes/EKS (advanced orchestration – post-dissertation learning path)
- Advanced security compliance (HIPAA, PCI-DSS)
- Production-scale traffic simulation
- Machine learning or AI components

## 1.7 Research Questions
1. How can Infrastructure as Code reduce deployment time and configuration errors compared to manual provisioning?
2. What is the impact of automated CI/CD pipelines on deployment frequency and failure recovery time?
3. How can cost optimization techniques be integrated into a DevOps pipeline for educational projects?

## 1.8 Benefits Derivable from the Work
1. Elimination of manual effort		: Automated pipeline reduces deployment time from hours to under 10 minutes
2. Infrastructure reproducibility	: Terraform code ensures identical environments can be recreated on demand
3. Improved reliability			: Automated testing catches defects before production deployment
4. Career progression			: Hands-on experience with Terraform, GitHub Actions, Docker, AWS – skills commanding 30-50% salary premiums
5. Portfolio asset			: Public GitHub repository demonstrating end-to-end DevOps implementation
6. Knowledge transfer			: Comprehensive documentation enables team understanding and extension
7. *Cost visibility			: Automated cost analysis prevents unexpected AWS billing surprises
