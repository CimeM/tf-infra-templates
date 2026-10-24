# Terraform template

[![Terraform CI](https://github.com/CimeM/tf-infra-templates/actions/workflows/terraform-ci.yml/badge.svg)](https://github.com/CimeM/tf-infra-templates/actions) [![Dependabot](https://img.shields.io/badge/Dependabot-active-025E8C?logo=dependabot)](https://github.com/YOUR_USERNAME/dns-terraform/network/updates)

## Templates
### DNS
DNS template creates root domain in the provider and inserts CNAME, A and txt records. 

## Terraform

### tfstate
Terraform state is stored in S3 storage provider

### Providers:
- S3 ![Cloudflare R2](https://img.shields.io/badge/Cloudflare_R2-State_Backend-F38020?logo=cloudflare)
- DNS ![DigitalOcean](https://img.shields.io/badge/DigitalOcean-Provider-0080FF?logo=digitalocean)

## Setup

Tools:
- tflint 0.65.0
- ![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.6.0-623CE4?logo=terraform) v1.17.0 

File: '.git/hooks/pre-commit'
``` sh
#!/bin/sh
set -e

echo "Running terraform fmt..."
terraform fmt -check -recursive

echo "Running tflint..."
tflint
```
