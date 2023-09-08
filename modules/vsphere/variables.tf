variable "vsphere" {
  description = "the vsphere names of the datacenter, datastore, cluster and network and optional the name of tag_category and disk and the folder"
  type = object({
    datacenter_name   = string
    datastore_name    = string
    cluster_name      = string
    network_name      = string
    folder            = optional(string, "/")
    disk_name         = optional(string, "disk0")
    tag_category_name = optional(string, null)
  })
  default = null
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
