variable "folder_id" { description = "ID of the root folder." }
variable "folder_name" { description = "Name of the folder to create." }
variable "folder_iam" {
  description = "The IAM policies to apply at the folder level. Map a member to a list of roles."
  type        = map(list(string))
  default     = {}
}

locals {
  iam_loop = flatten([for member, roles in var.folder_iam : [for r in roles : { "${member}_${r}" = { "member" = member, "role" = r } }]])
}

resource "google_folder" "folder" {
  parent       = var.folder_id
  display_name = var.folder_name
}

resource "google_folder_iam_member" "members" {
  for_each = { for item in local.iam_loop : keys(item)[0] => values(item)[0] }
  folder   = google_folder.folder.name
  role     = each.value.role
  member   = each.value.member
}

output "folder" {
  value = google_folder.folder
}

output "display_name" {
  value = var.folder_name
}
