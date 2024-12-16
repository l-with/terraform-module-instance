output "instance" {
  description = "the instance resource"
  value = (!var.instance ? null :
    (var.ignore_changes ? vsphere_virtual_machine.instance_ignore_changes[0] : vsphere_virtual_machine.instance[0])
  )
}

output "name" {
  description = "the name of the instance"
  value       = var.name
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value = (!var.instance ? null :
    (var.ipv4_address_var ? var.ipv4_address :
      (var.ignore_changes ? vsphere_virtual_machine.instance_ignore_changes[0].default_ip_address : vsphere_virtual_machine.instance[0].default_ip_address)
    )
  )
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance (default is instance_ip_address)"
  value = (!var.instance ? null :
    (var.ipv4_address_var ? var.ipv4_address :
      (var.ignore_changes ? vsphere_virtual_machine.instance_ignore_changes[0].default_ip_address : vsphere_virtual_machine.instance[0].default_ip_address)
    )
  )
}

output "vsphere_folder" {
  value = var.vsphere.folder
}

output "vsphere_disk_name" {
  value = var.vsphere.disk_name
}
