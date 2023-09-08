output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : vsphere_virtual_machine.instance[0]
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value       = !var.instance ? null : vsphere_virtual_machine.instance[0]
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance"
  value       = null
}
