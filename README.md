# project1 — Terraform + GitHub Actions (OIDC) ✨

This repository is a sample project to demonstrate recommended best practices for using Terraform with GitHub Actions (OIDC-based) to provision AWS resources using IAM roles.

Summary:
- Terraform code organized into reusable modules and environment overlays
- Remote state in S3 with DynamoDB state locking
- CI pipeline using GitHub Actions with OIDC to assume an AWS role
- Minimal example module (S3), an IAM module for creating the GitHub OIDC role (optional)

Quick start:
1. Bootstrap remote state (S3 + DynamoDB): run `scripts\bootstrap-backend.ps1` (or create those manually)
2. Configure environment and backend as needed (see `terraform/envs`)
3. For local development: run `terraform init` and `terraform plan` in `terraform/envs/dev`
4. Create GitHub OIDC AWS role and attach policies (checkout `docs/github-oidc-role-setup.md`)
5. Create a PR to see `terraform plan` run from GitHub Actions

See `docs/` for more details about backend bootstrapping, role creation, and GitHub Actions policies.
