config {
  plugin_dir = "~/.tflint.d/plugins"
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}