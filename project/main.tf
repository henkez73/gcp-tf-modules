variable "folder" { description = "The folder name of the parent folder." }
variable "org_id" { description = "The organisation ID for the parent org." }
variable "billing_account" { description = "The billing account to bind to the project." }
variable "env_name" { description = "The name of the environment." }
variable "apis" {
  description = "A list of APIs to enable for the project."
  type        = list(string)
}
variable "labels" {
  description = "map of labels to add to project"
  type        = map(string)
  default     = {}
}
variable "prefix" {}
variable "project_iam" {
  description = "The IAM policies to apply at the project level. Map a member to a list of roles."
  type        = map(list(string))
  default     = {}
}
variable "host_network" {
  description = "Host network (shared)"
  default     = ""
}
variable "host_project" {
  description = "is this the host project?"
  default     = false
}


locals {
  iam_loop = flatten([for member, roles in var.project_iam : [for r in roles : { "${member}_${r}" = { "member" = member, "role" = r } }]])

  host_network       = var.host_network == "" ? null : jsondecode(var.host_network)
  shared_vpc_enabled = var.host_network == "" ? false : true
  shared_vpc         = var.host_network == "" ? "" : local.host_network.project_id
  shared_vpc_subnets = var.host_network == "" ? [""] : local.host_network.subnets_self_links
}

module "project" {
  source                      = "git@github.com:cts-terraform-modules/terraform-google-project-factory.git//modules/core_project_factory?ref=v11.0.0"
  name                        = "${var.prefix}-${var.env_name}"
  random_project_id           = true
  folder_id                   = var.folder
  org_id                      = var.org_id
  billing_account             = var.billing_account
  activate_apis               = var.apis
  disable_services_on_destroy = false
  disable_dependent_services  = false
  labels                      = var.labels

  enable_shared_vpc_host_project    = var.host_project
  enable_shared_vpc_service_project = local.shared_vpc_enabled
  shared_vpc                        = local.shared_vpc
  shared_vpc_subnets                = local.shared_vpc_subnets
}

resource "google_project_iam_member" "members" {
  for_each = { for item in local.iam_loop : keys(item)[0] => values(item)[0] }
  project  = module.project.project_id
  role     = each.value.role
  member   = each.value.member
}

output "project" { value = module.project }
