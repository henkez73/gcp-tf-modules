# folder

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_folder.folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder_iam_member.members](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_iam"></a> [folder\_iam](#input\_folder\_iam) | The IAM policies to apply at the folder level. Map a member to a list of roles. | `map(list(string))` | `{}` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the root folder. | `any` | n/a | yes |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | Name of the folder to create. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | n/a |
| <a name="output_folder"></a> [folder](#output\_folder) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
