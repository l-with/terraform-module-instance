output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : scaleway_instance_server.instance[0]
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value       = !var.instance ? null : scaleway_instance_server.instance[0].public_ip
}

output "scaleway_infos" {
  description = "scaleway infos about the selected instance"
  value       = {
    zone = local.scaleway_zone,
    type = local.scaleway_instance_commercial_type,
    monthly_price = local.scaleway_instance_monthly_price,
  }
}

output "scaleway_instance_types" {
  value = local.scaleway_instance_types
}