# Terraform Module instance hetzner

Terraform module to provide a sever instance on 

- [scaleway](https://registry.terraform.io/providers/scaleway/scaleway/latest)

## Motivation

The motivation is to make switching between platforms as easy as possible.

## terraform

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.43 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.43.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [scaleway_instance_server.instance](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_server) | resource |
| [http_http.scaleway_instance_types](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_tags"></a> [assign\_tags](#input\_assign\_tags) | the tags to assign to the instance | `list(any)` | `[]` | no |
| <a name="input_country"></a> [country](#input\_country) | the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created | `any` | `null` | no |
| <a name="input_decoupled_ip"></a> [decoupled\_ip](#input\_decoupled\_ip) | if the instance should be created with a decoupled ip | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | the image the instance should be created from | `string` | `null` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | if the instance should be created | `bool` | `true` | no |
| <a name="input_ipv4_address"></a> [ipv4\_address](#input\_ipv4\_address) | the ipv4\_address of a hcloud\_primary\_ip (needs decoupled\_ip) | `string` | `null` | no |
| <a name="input_ipv4_address_var"></a> [ipv4\_address\_var](#input\_ipv4\_address\_var) | if the variable ipv4\_address is set (for decoupling count) | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | the name of the instance | `string` | `null` | no |
| <a name="input_scaleway_access_key"></a> [scaleway\_access\_key](#input\_scaleway\_access\_key) | the scaleway access key | `string` | `null` | no |
| <a name="input_scaleway_image_map"></a> [scaleway\_image\_map](#input\_scaleway\_image\_map) | the mapping of image names to scaleway image names | `list(map(string))` | <pre>[<br>  {<br>    "alma-8": "almalinux_8",<br>    "alma-9": "almalinux_9",<br>    "centos-stream-9": "centos_stream_9",<br>    "debian-11": "debian_bullseye",<br>    "debian-12": "debian_bookworm",<br>    "fedora-39": "fedora_39",<br>    "fedora-40": "fedora_40",<br>    "rocky-8": "rockylinux_8",<br>    "rocky-9": "rockylinux_9",<br>    "ubuntu-20.04": "ubuntu_focal",<br>    "ubuntu-22.04": "ubuntu_jammy",<br>    "ubuntu-24.04": "ubuntu_noble"<br>  }<br>]</pre> | no |
| <a name="input_scaleway_preferred_country_zones"></a> [scaleway\_preferred\_country\_zones](#input\_scaleway\_preferred\_country\_zones) | the location that should be preferred for the countries with more than one location | `list(map(string))` | <pre>[<br>  {<br>    "FR": "fr-par-1",<br>    "NL": "nl-ams-1",<br>    "PL": "pl-waw-1"<br>  }<br>]</pre> | no |
| <a name="input_scaleway_secret_key"></a> [scaleway\_secret\_key](#input\_scaleway\_secret\_key) | the scaleway secret key | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | the SSH key IDs or names which should be injected into the server at creation time | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to create and assign to the instance | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | the type of the instance (will be transformed matching the possiblities of the cloud\_provider) | <pre>object({<br>    vcpus : number,<br>    ram : number,<br>    disk : number,<br>  })</pre> | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | the cloud-Init user data to use during instance creation | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | the instance resource |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | the ip address of the instance |
| <a name="output_scaleway_instance_type"></a> [scaleway\_instance\_type](#output\_scaleway\_instance\_type) | the selected scaleway instance commercial type |
| <a name="output_scaleway_zone"></a> [scaleway\_zone](#output\_scaleway\_zone) | the name of the selected scaleway zone |
<!-- END_TF_DOCS -->
