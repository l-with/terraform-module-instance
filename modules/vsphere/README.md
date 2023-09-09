# Terraform Modul instance vsphere

Terraform module to provide instance on 

- [digitalocean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest) 
- [hetzner](https://registry.terraform.io/providers/hetznercloud/hcloud/latest)
- [vsphere](https://registry.terraform.io/providers/hashicorp/vsphere/latest)

## Motivation

The motivation is to make switching between platforms as easy as possible.

## terraform

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | ~> 2.4.2 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 2.4.2 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [vsphere_tag.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/tag) | resource |
| [vsphere_virtual_machine.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_network.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_tag_category.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/tag_category) | data source |
| [vsphere_virtual_machine.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_tags"></a> [assign\_tags](#input\_assign\_tags) | the tags to assign to the instance | `list(any)` | `[]` | no |
| <a name="input_country"></a> [country](#input\_country) | the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created | `any` | `null` | no |
| <a name="input_decoupled_ip"></a> [decoupled\_ip](#input\_decoupled\_ip) | if the instance should be created with a decoupled ip | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | the image the instance should be created from | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | if the instance should be created | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | the name of the instance | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | the SSH key IDs or names which should be injected into the server at creation time | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to create and assign to the instance | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | the type of the instance (will be transformed matching the possiblities of the cloud\_provider) | <pre>object({<br>    vcpus : number,<br>    ram : number,<br>    disk : number,<br>  })</pre> | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | the cloud-Init user data to use during instance creation | `string` | `null` | no |
| <a name="input_vsphere"></a> [vsphere](#input\_vsphere) | the vsphere names of the datacenter, datastore, cluster and network and optional the name of tag\_category and disk and the folder | <pre>object({<br>    datacenter_name   = string<br>    datastore_name    = string<br>    cluster_name      = string<br>    network_name      = string<br>    folder            = optional(string, "/")<br>    disk_name         = optional(string, "disk0")<br>    tag_category_name = optional(string, null)<br>  })</pre> | `null` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | the instance resource |
| <a name="output_instance_decoupled_ip_address"></a> [instance\_decoupled\_ip\_address](#output\_instance\_decoupled\_ip\_address) | the decoupled ip address of the instance (default is instance\_ip\_address) |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | the ip address of the instance |
<!-- END_TF_DOCS -->