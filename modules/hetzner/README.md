# Terraform Module instance hetzner

Terraform module to provide a sever instance on 

- [hetzner](https://registry.terraform.io/providers/hetznercloud/hcloud/latest)

## Motivation

The motivation is to make switching between platforms as easy as possible.

## terraform

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.44 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.42.1 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hetzner_server_type"></a> [hetzner\_server\_type](#module\_hetzner\_server\_type) | rhythmictech/errorcheck/terraform | ~> 1.3.0 |

#### Resources

| Name | Type |
|------|------|
| [hcloud_primary_ip.instance](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |
| [hcloud_server.instance](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_primary_ip.instance](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/primary_ip) | data source |
| [http_http.hetzner_datacenters](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.hetzner_images](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.hetzner_locations](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.hetzner_server_types](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_tags"></a> [assign\_tags](#input\_assign\_tags) | the tags to assign to the instance | `list(any)` | `[]` | no |
| <a name="input_country"></a> [country](#input\_country) | the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created | `any` | `null` | no |
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | the needed cpu architecture of the instance, supported values are 'x86', 'arm', '*' | `string` | `"x86"` | no |
| <a name="input_decoupled_ip"></a> [decoupled\_ip](#input\_decoupled\_ip) | if the instance should be created with a decoupled ip | `bool` | `false` | no |
| <a name="input_hetzner_preferred_country_locations"></a> [hetzner\_preferred\_country\_locations](#input\_hetzner\_preferred\_country\_locations) | the location that should be preferred for the countries with more than one location | `list(map(string))` | <pre>[<br>  {<br>    "DE": "fsn1",<br>    "US": "hil"<br>  }<br>]</pre> | no |
| <a name="input_hetzner_token"></a> [hetzner\_token](#input\_hetzner\_token) | the Hetzner Cloud API Token (used to query the server types) | `string` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | the image the instance should be created from | `string` | `null` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | if the instance should be created | `bool` | `true` | no |
| <a name="input_ipv4_address"></a> [ipv4\_address](#input\_ipv4\_address) | the ipv4\_address of a hcloud\_primary\_ip (needs decoupled\_ip) | `string` | `null` | no |
| <a name="input_ipv4_address_var"></a> [ipv4\_address\_var](#input\_ipv4\_address\_var) | if the variable ipv4\_address is set (for decoupling count) | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | the name of the instance | `string` | `null` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | n/a | <pre>list(object({<br>    network_id = number,<br>    ip         = optional(string, null)<br>    alias_ips  = optional(list(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | the SSH key IDs or names which should be injected into the server at creation time | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to create and assign to the instance | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | the type of the instance (will be transformed matching the possiblities of the cloud\_provider) | <pre>object({<br>    vcpus : number,<br>    ram : number,<br>    disk : number,<br>  })</pre> | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | the cloud-Init user data to use during instance creation (size limit 32768) | `string` | `null` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_hetzner_datacenter_name"></a> [hetzner\_datacenter\_name](#output\_hetzner\_datacenter\_name) | the name of the selected hetzner datacenter |
| <a name="output_hetzner_datacenters"></a> [hetzner\_datacenters](#output\_hetzner\_datacenters) | the list of the hetzner datacenters |
| <a name="output_hetzner_location_name"></a> [hetzner\_location\_name](#output\_hetzner\_location\_name) | the name of the selected hetzner location |
| <a name="output_hetzner_locations"></a> [hetzner\_locations](#output\_hetzner\_locations) | the list of the hetzner locations |
| <a name="output_hetzner_preferred_country_locations"></a> [hetzner\_preferred\_country\_locations](#output\_hetzner\_preferred\_country\_locations) | the location that should be preferred for the countries with more than one location |
| <a name="output_hetzner_server_images"></a> [hetzner\_server\_images](#output\_hetzner\_server\_images) | the list of the hetzner server images |
| <a name="output_hetzner_server_type"></a> [hetzner\_server\_type](#output\_hetzner\_server\_type) | the selected hetzner server type |
| <a name="output_hetzner_server_types"></a> [hetzner\_server\_types](#output\_hetzner\_server\_types) | the list of the hetzner server types |
| <a name="output_instance"></a> [instance](#output\_instance) | the instance resource |
| <a name="output_instance_decoupled_ip_address"></a> [instance\_decoupled\_ip\_address](#output\_instance\_decoupled\_ip\_address) | the decoupled ip address of the instance (default is instance\_ip\_address) |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | the ip address of the instance |
<!-- END_TF_DOCS -->
