# Terraform Module instance hetzner

Terraform module to provide a sever instance on

- [contabo](https://registry.terraform.io/providers/contabo/contabo/latest)

## Motivation

The motivation is to make switching between platforms as easy as possible.

## terraform

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_contabo"></a> [contabo](#requirement\_contabo) | ~> 0.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | ~> 2.3 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_contabo"></a> [contabo](#provider\_contabo) | 0.1.26 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.3 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.2 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_contabo_instance_type"></a> [contabo\_instance\_type](#module\_contabo\_instance\_type) | rhythmictech/errorcheck/terraform | ~> 1.3.0 |

#### Resources

| Name | Type |
|------|------|
| [contabo_instance.instance](https://registry.terraform.io/providers/contabo/contabo/latest/docs/resources/instance) | resource |
| [contabo_tag.instance](https://registry.terraform.io/providers/contabo/contabo/latest/docs/resources/tag) | resource |
| [contabo_tag_assignment.instance](https://registry.terraform.io/providers/contabo/contabo/latest/docs/resources/tag_assignment) | resource |
| [external_external.contabo_token](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [http_http.contabo_images](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.contabo_secrets](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_tags"></a> [assign\_tags](#input\_assign\_tags) | the tags to assign to the instance | `list(any)` | `[]` | no |
| <a name="input_contabo_client_id"></a> [contabo\_client\_id](#input\_contabo\_client\_id) | the contabo oauth2 client id | `string` | n/a | yes |
| <a name="input_contabo_client_secret"></a> [contabo\_client\_secret](#input\_contabo\_client\_secret) | the contabo oauth2 client secret | `string` | n/a | yes |
| <a name="input_contabo_image_map"></a> [contabo\_image\_map](#input\_contabo\_image\_map) | the mapping of image names to digitalocean image names | `list(map(string))` | <pre>[<br>  {<br>    "alma-8": "almalinux-8",<br>    "alma-9": "almalinux-9",<br>    "debian-10": "debian-10-x64",<br>    "debian-11": "debian-11-x64",<br>    "debian-12": "debian-12-x64",<br>    "rocky-8": "rockylinux-8",<br>    "rocky-9": "rockylinux-9"<br>  }<br>]</pre> | no |
| <a name="input_contabo_pass"></a> [contabo\_pass](#input\_contabo\_pass) | the contabo API password | `string` | n/a | yes |
| <a name="input_contabo_preferred_country_regions"></a> [contabo\_preferred\_country\_regions](#input\_contabo\_preferred\_country\_regions) | the region that should be preferred for the countries with more than one region | `list(map(string))` | <pre>[<br>  {<br>    "US": "US-central"<br>  }<br>]</pre> | no |
| <a name="input_contabo_user"></a> [contabo\_user](#input\_contabo\_user) | the contabo API user | `string` | n/a | yes |
| <a name="input_country"></a> [country](#input\_country) | the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created | `any` | `null` | no |
| <a name="input_decoupled_ip"></a> [decoupled\_ip](#input\_decoupled\_ip) | if the instance should be created with a decoupled ip (ignored for contabo) | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | the image the instance should be created from | `string` | `null` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | if the instance should be created | `bool` | `true` | no |
| <a name="input_ipv4_address"></a> [ipv4\_address](#input\_ipv4\_address) | the ipv4\_address of a hcloud\_primary\_ip (needs decoupled\_ip) (ignored for contabo) | `string` | `null` | no |
| <a name="input_ipv4_address_var"></a> [ipv4\_address\_var](#input\_ipv4\_address\_var) | if the variable ipv4\_address is set (for decoupling count) (ignored for contabo) | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | the name of the instance | `string` | `null` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | n/a | <pre>list(object({<br>    network_id = number,<br>    ip         = optional(string, null)<br>    alias_ips  = optional(list(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | the SSH keys names which should be injected into the instance at creation time | `list(string)` | `[]` | no |
| <a name="input_tag_color"></a> [tag\_color](#input\_tag\_color) | the colour for the contabo tags | `string` | `"#409ce8"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to create and assign to the instance | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | the type of the instance (will be transformed matching the possiblities of the cloud\_provider) | <pre>object({<br>    vcpus : number,<br>    ram : number,<br>    disk : number,<br>  })</pre> | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | the cloud-Init user data to use during instance creation (size limit 32768) | `string` | `null` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_contabo_images"></a> [contabo\_images](#output\_contabo\_images) | the list of the contabo images |
| <a name="output_contabo_instance_product_id"></a> [contabo\_instance\_product\_id](#output\_contabo\_instance\_product\_id) | the selected contabo instance product id |
| <a name="output_contabo_instance_types"></a> [contabo\_instance\_types](#output\_contabo\_instance\_types) | the list of the contabo instance types |
| <a name="output_contabo_regions"></a> [contabo\_regions](#output\_contabo\_regions) | the list of the contabo regions |
| <a name="output_instance"></a> [instance](#output\_instance) | the instance resource |
| <a name="output_instance_decoupled_ip_address"></a> [instance\_decoupled\_ip\_address](#output\_instance\_decoupled\_ip\_address) | the decoupled ip address of the instance (default is instance\_ip\_address) |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | the ip address of the instance |
<!-- END_TF_DOCS -->