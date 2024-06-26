locals {
  vsphere_wait_for_guest_net_timeout = var.ipv4_address_var ? 0 : var.vsphere_wait_for_guest_net_timeout
}

data "vsphere_datacenter" "instance" {
  count = var.instance ? 1 : 0

  name = var.vsphere.datacenter_name
}

data "vsphere_datastore" "instance" {
  count = var.instance ? 1 : 0

  name          = var.vsphere.datastore_name
  datacenter_id = data.vsphere_datacenter.instance[0].id
}

data "vsphere_compute_cluster" "instance" {
  count = var.instance ? 1 : 0

  name          = var.vsphere.cluster_name
  datacenter_id = data.vsphere_datacenter.instance[0].id
}

data "vsphere_network" "instance" {
  count = var.instance ? 1 : 0

  name          = var.vsphere.network_name
  datacenter_id = data.vsphere_datacenter.instance[0].id
}

data "vsphere_virtual_machine" "instance" {
  count = var.instance ? 1 : 0

  name          = var.image
  datacenter_id = data.vsphere_datacenter.instance[0].id
}

data "vsphere_tag_category" "instance" {
  count = (var.instance && var.vsphere.tag_category_name != null) ? 1 : 0

  name = var.vsphere.tag_category_name
}

data "vsphere_resource_pool" "instance" {
  count = (var.instance && var.vsphere.resource_pool_name != null) ? 1 : 0

  name          = var.vsphere.resource_pool_name
  datacenter_id = data.vsphere_datacenter.instance[0].id
}

resource "vsphere_tag" "instance" {
  count = var.instance ? length(var.tags) : 0

  category_id = data.vsphere_tag_category.instance[0].id
  name        = var.tags[count.index]
}

resource "vsphere_virtual_machine" "instance" {
  count = var.instance && !var.ignore_changes ? 1 : 0

  replace_trigger = base64sha512(
    jsonencode({
      user-data   = var.user_data,
      public-keys = var.ssh_keys,
    })
  )
  name             = var.name
  resource_pool_id = var.vsphere.resource_pool_name == null ? data.vsphere_compute_cluster.instance[0].resource_pool_id : data.vsphere_resource_pool.instance[0].id
  datastore_id     = data.vsphere_datastore.instance[0].id
  guest_id         = data.vsphere_virtual_machine.instance[0].guest_id
  folder           = var.vsphere.folder
  num_cpus         = var.type.vcpus
  memory           = 1024 * var.type.ram
  firmware         = "efi"
  tags = concat(
    vsphere_tag.instance[*].id,
    var.assign_tag_ids,
  )
  network_interface {
    network_id = data.vsphere_network.instance[0].id
  }
  wait_for_guest_net_timeout = local.vsphere_wait_for_guest_net_timeout
  disk {
    label            = var.vsphere.disk_name
    size             = var.type.disk
    eagerly_scrub    = data.vsphere_virtual_machine.instance[0].disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.instance[0].disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.instance[0].id
    dynamic "customize" {
      for_each = var.ipv4_address_var ? [1] : []
      content {
        linux_options {
          host_name = var.name
          domain    = ""
        }
        dynamic "network_interface" {
          for_each = var.ipv4_address_var ? [1] : []
          content {
            ipv4_address = var.ipv4_address
            ipv4_netmask = 24
          }
        }
      }
    }
  }
  cdrom {
    client_device = true
  }
  vapp {
    properties = {
      hostname    = var.name
      user-data   = var.user_data
      public-keys = length(var.ssh_keys) == 0 ? null : join("\n", var.ssh_keys)
    }
  }
}

resource "vsphere_virtual_machine" "instance_ignore_changes" {
  count = var.instance && var.ignore_changes ? 1 : 0

  lifecycle {
    ignore_changes = [
      disk,
      memory,
      name,
      num_cpus,
      vapp,
    ]
  }

  replace_trigger = base64sha512(
    jsonencode({
      user-data   = var.user_data,
      public-keys = var.ssh_keys,
    })
  )
  name             = var.name
  resource_pool_id = var.vsphere.resource_pool_name == null ? data.vsphere_compute_cluster.instance[0].resource_pool_id : data.vsphere_resource_pool.instance[0].id
  datastore_id     = data.vsphere_datastore.instance[0].id
  guest_id         = data.vsphere_virtual_machine.instance[0].guest_id
  folder           = var.vsphere.folder
  num_cpus         = var.type.vcpus
  memory           = 1024 * var.type.ram
  firmware         = "efi"
  tags = concat(
    vsphere_tag.instance[*].id,
    var.assign_tag_ids,
  )
  network_interface {
    network_id = data.vsphere_network.instance[0].id
  }
  wait_for_guest_net_timeout = local.vsphere_wait_for_guest_net_timeout
  disk {
    label            = var.vsphere.disk_name
    size             = var.type.disk
    eagerly_scrub    = data.vsphere_virtual_machine.instance[0].disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.instance[0].disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.instance[0].id
    dynamic "customize" {
      for_each = var.ipv4_address_var ? [1] : []
      content {
        linux_options {
          host_name = var.name
          domain    = ""
        }
        dynamic "network_interface" {
          for_each = var.ipv4_address_var ? [1] : []
          content {
            ipv4_address = var.ipv4_address
            ipv4_netmask = 24
          }
        }
      }
    }
  }
  cdrom {
    client_device = true
  }
  vapp {
    properties = {
      hostname    = var.name
      user-data   = var.user_data
      public-keys = length(var.ssh_keys) == 0 ? null : join("\n", var.ssh_keys)
    }
  }
}
