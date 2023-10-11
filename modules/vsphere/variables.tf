variable "vsphere" {
  description = "the vsphere names of the datacenter, datastore, cluster and network and optional the name of tag_category and disk and the folder"
  type = object({
    datacenter_name    = string
    datastore_name     = string
    cluster_name       = string
    resource_pool_name = optional(string, null)
    network_name       = string
    folder             = optional(string, "/")
    disk_name          = optional(string, "disk0")
    tag_category_name  = optional(string, null)
  })
  default = null
}

variable "vsphere_wait_for_guest_net_timeout" {
  description = <<EOF
    the amount of time, in minutes, to wait for an available guest IP address on the virtual machine
    - default (coded in terraform) depends on ipv4_address_var: 0 if true, 5 else
  EOF
  type        = number
  default     = 5
}

variable "instance" {
  description = "if the instance should be created"
  type        = bool
  default     = true
}

variable "decoupled_ip" {
  description = "if the instance should be created with a decoupled ip (ignored for vsphere)"
  type        = bool
  default     = false
}

variable "country" {
  description = "the [ISO 3166 country code](https://www.iso.org/obp/ui/#search) (Alpha-2) where the instance should be created (ignored for vsphere)"
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
  description = "the cloud-Init user data to use during instance creation (base64 encoded, size limit 65535)"
  type        = string
  default     = null
  sensitive   = true
}

variable "assign_tag_ids" {
  description = "the tag ids to assign to the instance"
  type        = list(string)
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
  description = "the static ipv4_address (needs decoupled_ip)"
  type        = string
  default     = null
}
