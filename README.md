# Terraform template

## Templates
### DNS
DNS template creates root domain in the provider and inserts CNAME, A and txt records. 

## Terraform

### tfstate
Terraform state is stored in S3 storage provider

### Providers:
- S3 Cloudflare R2
- DNS DigitalOcean

## Setup

Tools:
- tflint 0.65.0
- terraform v1.17.0

File: '.git/hooks/pre-commit'
``` sh
#!/bin/sh
set -e

echo "Running terraform fmt..."
terraform fmt -check -recursive

echo "Running tflint..."
tflint
```
