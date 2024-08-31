locals {
  scaleway_zones = [
    {
      country = "FR"
      name    = "fr-par-1"
    },
    {
      country = "FR"
      name    = "fr-par-2"
    },
    {
      country = "FR"
      name    = "fr-par-3"
    },
    {
      country = "NL"
      name    = "nl-ams-1"
    },
    {
      country = "NL"
      name    = "nl-ams-2"
    },
    {
      country = "NL"
      name    = "nl-ams-3"
    },
    {
      country = "PL"
      name    = "pl-waw-1"
    },
    {
      country = "PL"
      name    = "pl-waw-2"
    },
    {
      country = "PL"
      name    = "pl-waw-3"
    },
  ]
  merged_scaleway_preferred_country_zones = merge(var.scaleway_preferred_country_zones...)

  scaleway_zone = local.merged_scaleway_preferred_country_zones[var.country]
}

data "http" "scaleway_instance_types" {
  url = "https://api.scaleway.com/instance/v1/zones/${local.scaleway_zone}/products/servers"
  request_headers = {
    X-Auth-Token = var.scaleway_secret_key
  }
}

locals {
  scaleway_instance_type_map = {
    "x86" = "x86_64",
    "arm" = "arm64",
  }
  scaleway_instance_types = jsondecode(data.http.scaleway_instance_types.response_body).servers
  scaleway_instance_types_list = [
    for commercial_type, instance_type in local.scaleway_instance_types :
    {
      commercial_type = commercial_type
      arch            = instance_type.arch,
      hourly_price    = instance_type.hourly_price,
      ncpus           = instance_type.ncpus,
      ram             = instance_type.ram,
      ram_mb          = instance_type.ram / (1024 * 1024),
    }
  ]
  scaleway_instance_types_filtered = [
    for instance_type in local.scaleway_instance_types_list :
    instance_type if instance_type.ncpus >= var.type.vcpus
  ]
  scaleway_sorted_hourly_price_commercial_type = sort([
    for instance_type in local.scaleway_instance_types_filtered :
    "${instance_type.hourly_price}#${instance_type.commercial_type}"
  ])
  scaleway_instance_commercial_type = length(local.scaleway_sorted_hourly_price_commercial_type) == 0 ? null : split("#", local.scaleway_sorted_hourly_price_commercial_type[0])[1]
  scaleway_instance_name            = var.name == null ? "instance-server" : var.name
  scaleway_image_map                = merge(var.scaleway_image_map...)
  scaleway_image                    = var.image == null ? null : !contains(keys(local.scaleway_image_map), var.image) ? var.image : local.scaleway_image_map[var.image]

}

resource "scaleway_iam_ssh_key" "instance" {
  count = length(var.public_keys)

  name       = "${local.scaleway_instance_name}_${count.index}"
  public_key = var.public_keys[count.index]
}

resource "terraform_data" "user_data" {
  input = var.user_data_triggers_replace ? var.user_data : null
}

resource "scaleway_instance_server" "instance" {
  count = var.instance ? 1 : 0

  lifecycle {
    replace_triggered_by = [terraform_data.user_data]
  }
  name              = local.scaleway_instance_name
  tags              = var.tags
  type              = local.scaleway_instance_commercial_type
  image             = local.scaleway_image
  zone              = local.scaleway_zone
  enable_dynamic_ip = true
  user_data = {
    //instance = local.scaleway_instance_name
    cloud-init = var.user_data
  }
}
