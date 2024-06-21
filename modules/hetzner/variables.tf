variable "hetzner_token" {
  description = "the Hetzner Cloud API Token (used to query the server types)"
  type        = string
  default     = null
  sensitive   = true
}

variable "hetzner_preferred_country_locations" {
  description = "the location that should be preferred for the countries with more than one location"
  type        = list(map(string))
  default = [{
    "DE" = "fsn1",
    "US" = "hil",
  }]
}

variable "cpu_architecture" {
  description = <<EOT
  the needed cpu architecture of the instance, supported values are 'x86', 'arm', '*'
EOT
  type        = string
  default     = "x86"
  validation {
    condition     = contains(["x86", "arm", "*"], var.cpu_architecture)
    error_message = "Supported values are 'x86', 'arm', '*'."
  }
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

variable "hetzner_datacenter_name" {
  description = "the hetzner datacenter name to create the server in"
  type        = string
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

variable "networks" {
  type = list(object({
    network_id = number,
    ip         = optional(string, null)
    alias_ips  = optional(list(string), null)
  }))
  default = []
}

variable "ignore_changes" {
  description = "if changes of the attribute backups should be ignored"
  type        = bool
  default     = false
}
