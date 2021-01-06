variable "project_id" {
  type        = string
  description = "Project id where service account will be created."
}

variable "prefix" {
  type        = string
  description = "Prefix applied to service account names."
  default     = ""
}

variable "names" {
  type        = list(string)
  description = "Names of the service accounts to create."
  default     = []
}

variable "project_roles" {
  type        = list(string)
  description = "Common roles to apply to all service accounts, project=>role as elements."
  default     = []
}

variable "neustar_gcp_groups" {
    type        = list(string)
    description = "Neustar GCP Groups which required access to created Service Accounts"
    default     = []
}

variable "sa_role" {
  type        = string
  description = "SA roles to apply to Groups"
  default     = ""
}

variable "org_id" {
  type        = string
  description = "Id of the organization for org-level roles."
  default     = ""
}

variable "display_name" {
  type        = string
  description = "Display names of the created service accounts (defaults to 'Terraform-managed service account')"
  default     = "Terraform-managed service account"
}

variable "description" {
  type        = string
  description = "Descriptions of the created service accounts (defaults to no description)"
  default     = ""
}
