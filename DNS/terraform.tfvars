domains = {
  "exampl.com" = {
    server_ip          = "192.168.1.100"
    a_record_names     = ["@"]
    cname_target       = "cname.target."
    cname_record_names = ["abc"]
    txt_records = {
      "@" = "google-site-verification=123"
    }
  }
}
