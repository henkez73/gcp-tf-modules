variable "env_name" { description = "The environment currently being used" }
variable "project_id" { description = "Project to create network in" }
variable "host_project" {
  description = "Boolean for is this the shared vpc host project"
  default     = false
}
variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}
variable "prefix" {}

variable "network_name" {}

module "network" {
  source       = "git::ssh://git@github.com/cts-terraform-modules/terraform-google-network.git?ref=v3.1.2"
  project_id   = var.project_id
  network_name = var.network_name
  subnets      = var.subnets

  shared_vpc_host = var.host_project
}

output "network" { value = module.network }
