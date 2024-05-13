output "contabo_instance_types" {
  description = "the list of the contabo instance types"
  value       = local.contabo_instance_types
}

output "contabo_regions" {
  description = "the list of the contabo regions"
  value       = local.contabo_regions
}

output "contabo_images" {
  description = "the list of the contabo images"
  value       = local.contabo_images
}

output "contabo_instance_product_id" {
  description = "the selected contabo instance product id"
  value       = local.contabo_instance_product_id
}

output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : contabo_instance.instance[0]
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value       = !var.instance ? null : contabo.instance[0].ipv4_address
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance (default is instance_ip_address)"
  value       = !var.instance ? null : contabo.instance[0].ipv4_address
}