terraform {
  required_version = ">= 1.0.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  backend "s3" {
    bucket = "terraform-tfstate-dns"
    key    = "digitalocean-dns/terraform.tfstate"

    # Cloudflare R2
    region = "auto"
    endpoints = {
      s3 = "https://CLOUDFLARE_ID.r2.cloudflarestorage.com"
    }

    # R2: Required to bypass AWS validation
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}

provider "digitalocean" {
  # Token from DIGITALOCEAN_TOKEN env var
}