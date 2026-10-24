# 1. Create/Manage the Root Domain Zones
resource "digitalocean_domain" "root" {
  for_each = var.domains
  name     = each.key
}

locals {
  # A Records
  a_records_flat = flatten([
    for domain, cfg in var.domains : [
      for name in cfg.a_record_names : {
        key    = "${domain}_a_${name}"
        domain = domain
        name   = name
        value  = cfg.server_ip
      }
    ]
  ])

  # CNAME Records
  cname_records_flat = flatten([
    for domain, cfg in var.domains : [
      for name in cfg.cname_record_names : {
        key    = "${domain}_cname_${name}"
        domain = domain
        name   = name
        value  = cfg.cname_target
      }
    ]
  ])

  # TXT Records
  txt_records_flat = flatten([
    for domain, cfg in var.domains : [
      for txt_name, txt_val in cfg.txt_records : {
        key    = "${domain}_txt_${txt_name}"
        domain = domain
        name   = txt_name
        value  = txt_val
      }
    ]
  ])
}

# Loop and Create A Records
resource "digitalocean_record" "a_records" {
  for_each = { for r in local.a_records_flat : r.key => r }

  domain = digitalocean_domain.root[each.value.domain].name
  type   = "A"
  name   = each.value.name
  value  = each.value.value
  ttl    = 3600
}

# Loop and Create CNAME Records
resource "digitalocean_record" "cname_records" {
  for_each = { for r in local.cname_records_flat : r.key => r }

  domain = digitalocean_domain.root[each.value.domain].name
  type   = "CNAME"
  name   = each.value.name
  value  = each.value.value
  ttl    = 3600
}

# Loop and Create TXT Records
resource "digitalocean_record" "txt_records" {
  for_each = { for r in local.txt_records_flat : r.key => r }

  domain = digitalocean_domain.root[each.value.domain].name
  type   = "TXT"
  name   = each.value.name
  value  = each.value.value
  ttl    = 3600
}