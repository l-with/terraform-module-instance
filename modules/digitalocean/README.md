# Terraform Module instance digitalocean

Terraform module to provide instance on

- [digitalocean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest) 

## Motivation

The motivation is to make switching between platforms as easy as possible.

## terraform

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.31 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.22.3 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_digitalocean_droplet_size"></a> [digitalocean\_droplet\_size](#module\_digitalocean\_droplet\_size) | rhythmictech/errorcheck/terraform | ~> 1.3.0 |

### Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.instance](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_droplet.instance_ignore_change_name](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_tag.instance](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [http_http.digitalocean_images](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.digitalocean_regions](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.digitalocean_sizes](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_tags"></a> [assign\_tags](#input\_assign\_tags) | the tags to assign to the instance | `list(any)` | `[]` | no |
| <a name="input_country"></a> [country](#input\_country) | the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created | `any` | `null` | no |
| <a name="input_decoupled_ip"></a> [decoupled\_ip](#input\_decoupled\_ip) | if the instance should be created with a decoupled ip (ignored for digitalocean) | `bool` | `false` | no |
| <a name="input_digitalocean_droplet_agent"></a> [digitalocean\_droplet\_agent](#input\_digitalocean\_droplet\_agent) | value for [droplet\_agent](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet#droplet_agent)<br/>    (if the DigitalOcean agent used for providing access to the Droplet web console in the control panel should be installed) | `bool` | `false` | no |
| <a name="input_digitalocean_image_map"></a> [digitalocean\_image\_map](#input\_digitalocean\_image\_map) | the mapping of image names to digitalocean image names | `list(map(string))` | <pre>[<br/>  {<br/>    "alma-8": "almalinux-8-x64",<br/>    "alma-9": "almalinux-9-x64",<br/>    "centos-7": "centos-7-x64",<br/>    "centos-stream-8": "centos-stream-8-x64",<br/>    "centos-stream-9": "centos-stream-9-x64",<br/>    "debian-10": "debian-10-x64",<br/>    "debian-11": "debian-11-x64",<br/>    "debian-12": "debian-12-x64",<br/>    "fedora-37": "fedora-37-x64",<br/>    "rocky-8": "rockylinux-8-x64",<br/>    "rocky-9": "rockylinux-9-x64",<br/>    "ubuntu-20.04": "ubuntu-20-04-x64",<br/>    "ubuntu-22.04": "ubuntu-22-04-x64"<br/>  }<br/>]</pre> | no |
| <a name="input_digitalocean_preferred_country_region_slugs"></a> [digitalocean\_preferred\_country\_region\_slugs](#input\_digitalocean\_preferred\_country\_region\_slugs) | the region slug that should be preferred for the countries with more than one slug | `list(map(string))` | <pre>[<br/>  {<br/>    "US": "nyc3"<br/>  }<br/>]</pre> | no |
| <a name="input_digitalocean_region_slug_pattern_country_code_mapping"></a> [digitalocean\_region\_slug\_pattern\_country\_code\_mapping](#input\_digitalocean\_region\_slug\_pattern\_country\_code\_mapping) | the mapping of region slug to country | `list(map(string))` | <pre>[<br/>  {<br/>    "ams3": "NL",<br/>    "blr1": "IN",<br/>    "fra1": "DE",<br/>    "lon1": "GB",<br/>    "nyc1": "US",<br/>    "nyc3": "US",<br/>    "sfo2": "US",<br/>    "sfo3": "US",<br/>    "sgp1": "SG",<br/>    "syd1": "AU",<br/>    "tor1": "CA"<br/>  }<br/>]</pre> | no |
| <a name="input_digitalocean_token"></a> [digitalocean\_token](#input\_digitalocean\_token) | the Digital Ocean API token (used to query the server types) | `string` | `null` | no |
| <a name="input_ignore_change_name"></a> [ignore\_change\_name](#input\_ignore\_change\_name) | if changes of the attribute name should be ignored | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | the image the instance should be created from | `string` | `null` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | if the instance should be created | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | the name of the instance | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | the SSH key IDs or fingerprints which should be injected into the server at creation time | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to create and assign to the instance | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | the type of the instance (will be transformed matching the possiblities of the cloud\_provider) | <pre>object({<br/>    vcpus : number,<br/>    ram : number,<br/>    disk : number,<br/>  })</pre> | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | the cloud-Init user data to use during instance creation<br/>    NOTE: digitalocean does not support base64 encoded user\_data (and as a consequence also not gzipped and base64 encoded user\_data) | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_digitalocean_droplet_images"></a> [digitalocean\_droplet\_images](#output\_digitalocean\_droplet\_images) | the list of the digitalocean droplet images |
| <a name="output_digitalocean_droplet_size"></a> [digitalocean\_droplet\_size](#output\_digitalocean\_droplet\_size) | the selected digitalocean droplet size |
| <a name="output_digitalocean_droplet_sizes"></a> [digitalocean\_droplet\_sizes](#output\_digitalocean\_droplet\_sizes) | the list of the digitalocean droplet sizes |
| <a name="output_digitalocean_image_map"></a> [digitalocean\_image\_map](#output\_digitalocean\_image\_map) | the mapping of image names to digitalocean image names |
| <a name="output_digitalocean_preferred_country_region_slugs"></a> [digitalocean\_preferred\_country\_region\_slugs](#output\_digitalocean\_preferred\_country\_region\_slugs) | the region slug that should be preferred for the countries with more than one slug |
| <a name="output_digitalocean_region_slug"></a> [digitalocean\_region\_slug](#output\_digitalocean\_region\_slug) | the name of the selected digitalocean region |
| <a name="output_digitalocean_region_slug_pattern_country_code_mapping"></a> [digitalocean\_region\_slug\_pattern\_country\_code\_mapping](#output\_digitalocean\_region\_slug\_pattern\_country\_code\_mapping) | the mapping of region slug to country |
| <a name="output_digitalocean_regions"></a> [digitalocean\_regions](#output\_digitalocean\_regions) | the list of the digitalocean regions |
| <a name="output_instance"></a> [instance](#output\_instance) | the instance resource |
| <a name="output_instance_decoupled_ip_address"></a> [instance\_decoupled\_ip\_address](#output\_instance\_decoupled\_ip\_address) | the decoupled ip address of the instance (default is instance\_ip\_address) |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | the ip address of the instance |
| <a name="output_name"></a> [name](#output\_name) | the name of the instance |
<!-- END_TF_DOCS -->
