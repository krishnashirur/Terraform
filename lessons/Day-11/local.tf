# locals {
#   nsg_rules = {
#     "allow_http" = {
#       priority               = 100
#       destination_port_range = "80"
#       description           = "Allow HTTP"
#     },
#     "allow_https" = {
#       priority               = 110
#       destination_port_range = "443"
#       description           = "Allow HTTPS"
#     }
#   }
# }

locals {
  config_paths = [
    "./configs/main.tf",
    "./configs/variables.tf"
  ]

  path_checks = {
    for file_path in local.config_paths : file_path => {
      exists    = fileexists("${path.module}/${file_path}")
      directory = dirname(file_path)
    }
  }

  path_status = {
    for file_path, check in local.path_checks : file_path => {
      exists    = check.exists
      directory = check.directory
      status    = check.exists ? "File found" : "File missing"
    }
  }
}