# Terraform Modul instance

Terraform modules to provide instances on 

- [contabo](https://registry.terraform.io/providers/contabo/contabo/latest)
- [digitalocean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest) 
- [hetzner](https://registry.terraform.io/providers/hetznercloud/hcloud/latest)
- [scaleway](https://registry.terraform.io/providers/scaleway/scaleway/latest)
- [vsphere](https://registry.terraform.io/providers/hashicorp/vsphere/latest)

## Motivation

The motivation is to make switching between platforms as easy as possible.

## Differences

### ssh_key

- contabo
  - for the [attribute ssh_keys of the resource contabo_instance](https://registry.terraform.io/providers/contabo/contabo/latest/docs/resources/contabo_instance#ssh_keys) the ids of ssh keys can be used<br>
  - unfortunately the [data source contabo_secret](https://registry.terraform.io/providers/contabo/contabo/latest/docs/data-sources/contabo_secret) uses the id of the ssh key
  - the bypass is to retrieve all secrets via API and filter by name
- digitalocean
  - for the [attribute ssh_keys of the resource digitalocean_droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet#ssh_keys) the ids or fingerprints of ssh keys can be used<br>
  - the ids can be retrieved by [data source digitalocean_ssh_key](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/ssh_key) by the name of the ssh key
- hetzner
  - for the [attribute ssh_keys of the resource hcloud_server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server#ssh_keys) the ids or names of ssh keys can be used<br>
- scaleway
  - there is no attribute ssh_keys for the resource [scaleway_instance_server](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_server)
  - the ssh-keys of the organization and the project are used for the instance
  - the only possibility is to create ssh-keys with the [resource scaleway_iam_ssh_key](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_ssh_key)
- vsphere
  - for the [attribute vapp of the resource vsphere_virtual_machine](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine#vapp) in the sub-key properties the key public-keys can be used 

**Summary**

| provider     | ssh-key specification possibility |
|--------------|-----------------------------------|
| contabo      | name                              |
| digitalocean | name                              |
| hetzner      | id or name                        |
| scaleway     | public key                        |
| vsphere      | public key                        |