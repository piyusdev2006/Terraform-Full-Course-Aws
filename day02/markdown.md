# Terraform Day 02 — Commands Reference

Quick reference of all commands used on Day 02.

## Verify Terraform installation
```bash
terraform -version
```

## Initialize Terraform working directory
```bash
terraform init
```

## Validate Terraform configuration
```bash
terraform validate
```

## Show execution plan (no changes applied)
```bash
terraform plan
```

## (Optional) Apply changes to create resources
```bash
terraform apply
# or for auto-approve:
terraform apply -auto-approve
```

## AWS CLI — verify installation
```bash
aws --version
```

## AWS CLI — configure credentials (interactive)
```bash
aws configure
# follow prompts for:
# AWS Access Key ID
# AWS Secret Access Key
# Default region name (e.g., us-east-1)
# Default output format (optional)
```

## Notes / Helpful commands
```bash
# Show current AWS CLI configuration
aws configure list

# List saved AWS profiles
type %USERPROFILE%\.aws\credentials

# Terraform formatting and locking
terraform fmt
terraform providers lock -platform=windows_amd64

# Optional: show plan to a file and apply from file
terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
terraform apply "tfplan"
```
