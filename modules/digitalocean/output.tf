output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : digitalocean_droplet.instance[0]
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value       = !var.instance ? null : digitalocean_droplet.instance[0].ipv4_address
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance"
  value       = !var.instance ? null : digitalocean_droplet.instance[0].ipv4_address
}

output "digitalocean_droplet_sizes" {
  description = "the list of the digitalocean droplet sizes"
  value       = local.digitalocean_droplet_sizes
}

output "digitalocean_regions" {
  description = "the list of the digitalocean regions"
  value       = local.digitalocean_regions
}

output "digitalocean_droplet_images" {
  description = "the list of the digitalocean droplet images"
  value       = local.digitalocean_droplet_images_filtered
}

output "digitalocean_region_slug" {
  description = "the name of the selected digitalocean region"
  value       = local.digitalocean_region_slug
}

output "digitalocean_droplet_size" {
  description = "the selected digitalocean droplet size"
  value       = local.digitalocean_droplet_size
}