output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : scaleway_instance_server.instance[0]
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value       = !var.instance ? null : scaleway_instance_server.instance[0].public_ip
}

output "scaleway_zone" {
  description = "the name of the selected scaleway zone"
  value       = local.scaleway_zone
}

output "scaleway_instance_type" {
  description = "the selected scaleway instance commercial type"
  value       = local.scaleway_instance_commercial_type
}

