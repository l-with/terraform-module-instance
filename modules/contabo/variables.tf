variable "contabo_client_id" {
  description = "the contabo oauth2 client id"
  type        = string
}

variable "contabo_client_secret" {
  description = "the contabo oauth2 client secret"
  type        = string
  sensitive   = true
}

variable "contabo_user" {
  description = "the contabo API user"
  type        = string
}

variable "contabo_pass" {
  description = "the contabo API password"
  sensitive   = true
  type        = string
}

variable "contabo_preferred_country_regions" {
  description = "the region that should be preferred for the countries with more than one region"
  type        = list(map(string))
  default = [{
    "US" = "US-central"
  }]
}

variable "contabo_image_map" {
  description = "the mapping of image names to digitalocean image names"
  type        = list(map(string))
  default = [{
    "alma-8"    = "almalinux-8",
    "alma-9"    = "almalinux-9",
    "debian-10" = "debian-10-x64",
    "debian-11" = "debian-11-x64",
    "debian-12" = "debian-12-x64",
    "rocky-8"   = "rockylinux-8",
    "rocky-9"   = "rockylinux-9",
  }]
}

variable "instance" {
  description = "if the instance should be created"
  type        = bool
  default     = true
}

variable "decoupled_ip" {
  description = "if the instance should be created with a decoupled ip (ignored for contabo)"
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
  description = "the cloud-Init user data to use during instance creation (size limit 32768)"
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

variable "tag_color" {
  description = "the colour for the contabo tags"
  type        = string
  default     = "#409ce8"
}

variable "ssh_keys" {
  description = "the SSH key IDs which should be injected into the instance at creation time"
  type        = list(number)
  default     = []
}

variable "ipv4_address_var" {
  description = "if the variable ipv4_address is set (for decoupling count) (ignored for contabo)"
  type        = bool
  default     = false
}

variable "ipv4_address" {
  description = "the ipv4_address of a hcloud_primary_ip (needs decoupled_ip) (ignored for contabo)"
  type        = string
  default     = null
}

variable "networks" {
  type = list(object({
    network_id = number,
    ip         = optional(string, null)
    alias_ips  = optional(list(string), null)
  }))
  default = []
}