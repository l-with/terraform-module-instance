data "http" "hetzner_server_types" {
  url = "https://api.hetzner.cloud/v1/server_types?per_page=200"
  request_headers = {
    Authorization = "Bearer ${var.hetzner_token}"
  }
}

data "http" "hetzner_locations" {
  url = "https://api.hetzner.cloud/v1/locations"
  request_headers = {
    Authorization = "Bearer ${var.hetzner_token}"
  }
}

data "http" "hetzner_datacenters" {
  url = "https://api.hetzner.cloud/v1/datacenters"
  request_headers = {
    Authorization = "Bearer ${var.hetzner_token}"
  }
}

data "http" "hetzner_images" {
  url = "https://api.hetzner.cloud/v1/images?per_page=200"
  request_headers = {
    Authorization = "Bearer ${var.hetzner_token}"
  }
}

locals {
  hetzner_server_types  = jsondecode(data.http.hetzner_server_types.response_body).server_types
  hetzner_locations     = jsondecode(data.http.hetzner_locations.response_body).locations
  hetzner_datacenters   = jsondecode(data.http.hetzner_datacenters.response_body).datacenters
  hetzner_server_images = jsondecode(data.http.hetzner_images.response_body).images

  hetzner_server_type_regex_map = {
    "x86" = "cp{0,1}x.*",
    "arm" = "cax.*",
    "*"   = ".*",
  }
  hetzner_server_types_without_deprecation = [
    for server_type in local.hetzner_server_types : {
      cores       = server_type.cores,
      description = server_type.description,
      disk        = server_type.disk,
      memory      = server_type.memory,
      name        = server_type.name,
      prices      = server_type.prices
    } if can(regex(local.hetzner_server_type_regex_map[var.cpu_architecture], server_type.name))
  ]
  hetzner_server_images_filtered = [
    for server_image in local.hetzner_server_images : {
      architecture = server_image.architecture,
      description  = server_image.description,
      name         = server_image.name,
      os_flavor    = server_image.os_flavor,
      os_version   = server_image.os_version,
      os_version   = server_image.os_version,
    } if server_image.type != "snapshot" && server_image.status == "available"
  ]
  hetzner_server_types_filtered = [
    for server_type in local.hetzner_server_types_without_deprecation :
    server_type if server_type.cores >= var.type.vcpus && server_type.memory >= var.type.ram && server_type.disk >= var.type.disk
  ]
  hetzner_country_locations = [
    for location in local.hetzner_locations :
    location if location.country == var.country
  ]
  merged_hetzner_preferred_country_locations = merge(var.hetzner_preferred_country_locations...)
  hetzner_country_location = length(local.hetzner_country_locations) == 1 ? local.hetzner_country_locations : [
    for location in local.hetzner_country_locations :
    location if location.name == lookup(local.merged_hetzner_preferred_country_locations, var.country, location.name)
  ]
  hetzner_location_name = (
    length(local.hetzner_country_locations) == 0 ? null : (
      length(local.hetzner_country_location) == 1 ? local.hetzner_country_location[0].name :
      null
    )
  )
  hetzner_location_datacenter = {
    for datacenter in local.hetzner_datacenters :
    datacenter.location.name => datacenter.name
  }
  hetzner_datacenter_name = (
    var.hetzner_datacenter_name != null ? var.hetzner_datacenter_name : (
      local.hetzner_location_name == null ? null :
      local.hetzner_location_datacenter[local.hetzner_location_name]
    )
  )
  hetzner_server_types_filtered_location_prices = [
    for hetzner_server_type in local.hetzner_server_types_filtered : merge(
      hetzner_server_type,
      {
        prices = one([
          for price in hetzner_server_type.prices :
          price if price.location == local.hetzner_location_name
        ])
      }
    )
  ]
  hetzner_server_types_location_prices = [
    for hetzner_server_type in local.hetzner_server_types_filtered_location_prices :
    hetzner_server_type if hetzner_server_type.prices != null
  ]
  hetzner_sorted_price_hourly_name = sort([
    for sever_type in local.hetzner_server_types_location_prices :
    "${sever_type.prices.price_hourly.net}#${sever_type.name}"
  ])
  hetzner_server_type = length(local.hetzner_sorted_price_hourly_name) == 0 ? null : split("#", local.hetzner_sorted_price_hourly_name[0])[1]
}

module "hetzner_server_type" {
  source  = "rhythmictech/errorcheck/terraform"
  version = "~> 1.3.0"

  use_jq        = true
  assert        = length(local.hetzner_sorted_price_hourly_name) > 0
  error_message = "error: no matching server type available"
}

data "hcloud_primary_ip" "instance" {
  count = var.ipv4_address_var ? 1 : 0

  ip_address = var.ipv4_address
}

resource "hcloud_primary_ip" "instance" {
  count = var.instance && var.decoupled_ip && !var.ipv4_address_var ? 1 : 0

  name          = var.name
  datacenter    = local.hetzner_datacenter_name
  assignee_type = "server"
  auto_delete   = false
  type          = "ipv4"
  labels = {
    for tag in var.tags :
    tag => "true"
  }
}

resource "hcloud_server" "instance" {
  count = var.instance ? 1 : 0

  name        = var.name
  image       = var.image
  server_type = local.hetzner_server_type
  datacenter  = local.hetzner_datacenter_name
  ssh_keys    = var.ssh_keys
  user_data   = var.user_data
  labels = {
    for tag in var.tags :
    tag => "true"
  }
  dynamic "public_net" {
    for_each = var.decoupled_ip ? [1] : []
    content {
      ipv4 = var.ipv4_address_var ? data.hcloud_primary_ip.instance[0].id : hcloud_primary_ip.instance[0].id
      ipv6 = var.ipv4_address_var ? data.hcloud_primary_ip.instance[0].id : hcloud_primary_ip.instance[0].id
    }
  }
  dynamic "network" {
    for_each = var.networks
    content {
      network_id = network.value.network_id
      ip         = network.value.ip
    }
  }
}
