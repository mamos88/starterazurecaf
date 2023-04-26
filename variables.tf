#Core Variables
variable "deploy_core_landing_zones" {
  type    = bool
  default = false
}

variable "root_id" {
  type    = string
  default = "mg"
}

variable "root_name" {
  type    = string
  default = "root"
}

variable "tenant_id" {
  type    = string
}

variable "primary_location" {
  type    = string
  default = "westus"
}

# Management Module Variables
variable "deploy_management_resources" {
  type    = bool
  default = false
}
variable "management_resources_location" {
  type    = string
  default = "westus"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    BelongsTo = "Corporate Services"
  }
}

# Identity Module Variables
variable "deploy_identity_resources" {
  type    = bool
  default = false
}
variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "go_mamos@yahoo.com"
}

# connectivity Module Variables
variable "deploy_connectivity_resources" {
  type    = bool
  default = false
}

variable "connectivity_resources_location" {
  type    = string
  default = "westus"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    BelongsTo = "Network Team"
  }
}

variable "client_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_secret" {
  type = string
}
