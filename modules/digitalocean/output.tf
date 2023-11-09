output "instance" {
  description = "the instance resource"
  value = !var.instance ? null : (
    var.ignore_change_name ? digitalocean_droplet.instance_ignore_change_name[0] : digitalocean_droplet.instance[0]
  )
}

output "instance_ip_address" {
  description = "the ip address of the instance"
  value = !var.instance ? null : (
    var.ignore_change_name ? digitalocean_droplet.instance_ignore_change_name[0].ipv4_address : digitalocean_droplet.instance[0].ipv4_address
  )
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance (default is instance_ip_address)"
  value = !var.instance ? null : (
    var.ignore_change_name ? digitalocean_droplet.instance_ignore_change_name[0].ipv4_address : digitalocean_droplet.instance[0].ipv4_address
  )
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

output "digitalocean_image_map" {
  description = "the mapping of image names to digitalocean image names"
  value       = var.digitalocean_image_map
}

output "digitalocean_region_slug" {
  description = "the name of the selected digitalocean region"
  value       = local.digitalocean_region_slug
}

output "digitalocean_preferred_country_region_slugs" {
  description = "the region slug that should be preferred for the countries with more than one slug"
  value       = var.digitalocean_preferred_country_region_slugs
}

output "digitalocean_region_slug_pattern_country_code_mapping" {
  description = "the mapping of region slug to country"
  value       = var.digitalocean_region_slug_pattern_country_code_mapping
}

output "digitalocean_droplet_size" {
  description = "the selected digitalocean droplet size"
  value       = local.digitalocean_droplet_size
}