# project

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | git@github.com:cts-terraform-modules/terraform-google-project-factory.git//modules/core_project_factory | v11.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.members](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apis"></a> [apis](#input\_apis) | A list of APIs to enable for the project. | `list(string)` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account to bind to the project. | `any` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The name of the environment. | `any` | n/a | yes |
| <a name="input_folder"></a> [folder](#input\_folder) | The folder name of the parent folder. | `any` | n/a | yes |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | Host network (shared) | `string` | `""` | no |
| <a name="input_host_project"></a> [host\_project](#input\_host\_project) | is this the host project? | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | map of labels to add to project | `map(string)` | `{}` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organisation ID for the parent org. | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_project_iam"></a> [project\_iam](#input\_project\_iam) | The IAM policies to apply at the project level. Map a member to a list of roles. | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
