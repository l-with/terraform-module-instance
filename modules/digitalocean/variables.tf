variable "digitalocean_droplet_agent" {
  description = <<EOT
    value for [droplet_agent](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet#droplet_agent)
    (if the DigitalOcean agent used for providing access to the Droplet web console in the control panel should be installed)
  EOT
  type        = bool
  default     = false
}

variable "digitalocean_token" {
  description = "the Digital Ocean API token (used to query the server types)"
  type        = string
  default     = null
  sensitive   = true
}

variable "digitalocean_preferred_country_region_slugs" {
  description = "the region slug that should be preferred for the countries with more than one slug"
  type        = list(map(string))
  default = [{
    "US" : "nyc3",
  }]
}

variable "digitalocean_region_slug_pattern_country_code_mapping" {
  description = "the mapping of region slug to country"
  type        = list(map(string))
  default = [{
    "nyc1" = "US",
    "sgp1" = "SG",
    "lon1" = "GB",
    "nyc3" = "US",
    "ams3" = "NL",
    "fra1" = "DE",
    "tor1" = "CA",
    "sfo2" = "US",
    "blr1" = "IN",
    "sfo3" = "US",
    "syd1" = "AU",
  }]
}

variable "digitalocean_image_map" {
  description = "the mapping of image names to digitalocean image names"
  type        = list(map(string))
  default = [{
    "alma-8"          = "almalinux-8-x64",
    "alma-9"          = "almalinux-9-x64",
    "centos-7"        = "centos-7-x64",
    "centos-stream-8" = "centos-stream-8-x64",
    "centos-stream-9" = "centos-stream-9-x64",
    "fedora-37"       = "fedora-37-x64",
    "debian-10"       = "debian-10-x64",
    "debian-11"       = "debian-11-x64",
    "debian-12"       = "debian-12-x64",
    "rocky-8"         = "rockylinux-8-x64",
    "rocky-9"         = "rockylinux-9-x64",
    "ubuntu-20.04"    = "ubuntu-20-04-x64",
    "ubuntu-22.04"    = "ubuntu-22-04-x64",
  }]
}

variable "instance" {
  description = "if the instance should be created"
  type        = bool
  default     = true
}

variable "decoupled_ip" {
  description = "if the instance should be created with a decoupled ip (ignored for digitalocean)"
  type        = bool
  default     = false
}

variable "country" {
  description = "the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created"
  default     = null
}

variable "type" {
  description = "the type of the instance (will be transformed matching the possiblities of the cloud_provider)"
  type = object({
    vcpus : number,
    ram : number,
    disk : number,
  })
  default = null
}

variable "name" {
  description = "the name of the instance"
  type        = string
  default     = null
}

variable "image" {
  description = "the image the instance should be created from"
  type        = string
  default     = null
}

variable "user_data" {
  description = <<EOT
    the cloud-Init user data to use during instance creation
    NOTE: digitalocean does not support base64 encoded user_data (and as a consequence also not gzipped and base64 encoded user_data)
  EOT
  type        = string
  default     = null
  sensitive   = true
}

variable "assign_tags" {
  description = "the tags to assign to the instance"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "the tags to create and assign to the instance"
  type        = list(string)
  default     = []
}

variable "ssh_keys" {
  description = "the SSH key IDs or fingerprints which should be injected into the server at creation time"
  type        = list(string)
  default     = []
}

variable "ignore_change_name" {
  description = "if changes of the attribute name should be ignored"
  type        = bool
  default     = false
}
