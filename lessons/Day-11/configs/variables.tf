# String type
variable "project_name" {
  type        = string
  description = "Project name (e.g., dev, prod, staging)"
  default     = "Project ALPHA Resource"
}     


variable "default_tags"{
  type = map(string)
  default = {
    "company" = "CloudOps"
    "managed_by"       = "terraform"
  }
}

variable "environment_tags" {

  type        = map(string)
  default = {
    "environment" = "production"
    "cost_center" = "cc-12345"
  }
  
}

 variable "storage_account_name" {
    type        = string
    default = "techtutorials with!krishnathis should be formatted"
  }

 variable "allowed_ports" {
  type = string
  default = "80,443,3306"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, production."
  }
  
}

variable "vm_sizes" {
  type = map(string)
    default = {
    dev     = "standard_D2s_v3",
    staging = "standard_D4s_v3",
    prod    = "standard_D8s_v3"
    }
}


variable "vm_size" {
    type = string
    default = "standard_D2s_v3"
    validation {
      condition = length(var.vm_size) >=2 && length(var.vm_size)<= 20
      error_message = "The vm_size should be between 2 and 20 chars"
    }
    validation {
      condition = strcontains(lower(var.vm_size),"standard")
      error_message = "The vm size should contains standard"
    }
  
}

#assignment 7
variable "backup_name" {
  default = "test_backup"
  type = string
  validation {
    condition = endswith(var.backup_name,"_backup")
    error_message = "Backup should ends with _backup"
  }
}

variable "credential" {
  default = "xyz123"
  type = string
  sensitive = false
}