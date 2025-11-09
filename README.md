# Terraform-Script (modularized)

This repo contains a modularized Terraform structure with reusable modules for common AWS resources.

## Structure
- `modules/` — reusable, isolated modules (vpc, security-group, compute, elb, rds).
- `environments/<env>/` — environment-specific root config that composes modules and contains backend config.

## Quick start (dev)
1. Copy `environments/dev/terraform.tfvars.example` -> `environments/dev/terraform.tfvars` and fill values.
2. `cd environments/dev`
3. `terraform init`
4. `terraform plan`
5. `terraform apply`

## Notes
- Backend uses S3 + DynamoDB locking (update bucket/table names in backend.tf).
- Use AWS credentials in environment or AWS profile.
- Run `terraform fmt` and `terraform validate` before opening PRs.

## Creating a PR
Follow the commands in the PR instructions in repo root or my instructions from the assistant to push a branch and create a PR.
