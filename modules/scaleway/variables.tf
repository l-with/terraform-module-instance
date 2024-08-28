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

variable "hetzner_preferred_country_locations" {
  description = "the location that should be preferred for the countries with more than one location"
  type        = list(map(string))
  default = [{
    "DE" = "fsn1",
    "US" = "hil",
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
}

variable "image" {
  description = "the image the instance should be created from"
  type        = string
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
