variable "scaleway_access_key" {
  description = "the scaleway access key"
  type        = string
  default     = null
  sensitive   = true
}

variable "scaleway_secret_key" {
  description = "the scaleway secret key"
  type        = string
  default     = null
  sensitive   = true
}

variable "scaleway_preferred_country_zones" {
  description = "the location that should be preferred for the countries with more than one location"
  type        = list(map(string))
  default = [{
    "FR" = "fr-par-1",
    "NL" = "nl-ams-1",
    "PL" = "pl-waw-1",
  }]
}

variable "instance" {
  description = "if the instance should be created"
  type        = bool
  default     = true
}

variable "decoupled_ip" {
  description = "if the instance should be created with a decoupled ip"
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
  description = "the cloud-Init user data to use during instance creation"
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
  description = "the SSH key IDs or names which should be injected into the server at creation time"
  type        = list(string)
  default     = []
}

variable "ipv4_address_var" {
  description = "if the variable ipv4_address is set (for decoupling count)"
  type        = bool
  default     = false
}

variable "ipv4_address" {
  description = "the ipv4_address of a hcloud_primary_ip (needs decoupled_ip)"
  type        = string
  default     = null
}

variable "scaleway_image_map" {
  description = "the mapping of image names to scaleway image names"
  type        = list(map(string))
  default = [{
    "alma-8"          = "almalinux_8",
    "alma-9"          = "almalinux_9",
    "centos-stream-9" = "centos_stream_9",
    "debian-11"       = "debian_bullseye",
    "debian-12"       = "debian_bookworm",
    "fedora-39"       = "fedora_39",
    "fedora-40"       = "fedora_40",
    "rocky-8"         = "rockylinux_8",
    "rocky-9"         = "rockylinux_9",
    "ubuntu-20.04"    = "ubuntu_focal",
    "ubuntu-22.04"    = "ubuntu_jammy",
    "ubuntu-24.04"    = "ubuntu_noble"
  }]
}
