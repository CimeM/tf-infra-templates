variable "domains" {
  description = "Map of root domains and their unique DNS configurations"
  type = map(object({
    server_ip          = optional(string, "192.168.1.100")
    a_record_names     = optional(list(string), [])
    cname_target       = optional(string, "")
    cname_record_names = optional(list(string), [])
    txt_records        = optional(map(string), {})
  }))
  default = {}
}