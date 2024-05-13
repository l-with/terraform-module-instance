locals {
  contabo_request_id = upper(uuid())
}

data "external" "contabo_token" {
  program = [
    "sh",
    "${path.module}/contabo-get-token.sh"
  ]
  query = {
    contabo_realm_url     = "https://auth.contabo.com/auth/realms/contabo",
    contabo_client_id     = var.contabo_client_id,
    contabo_client_secret = var.contabo_client_secret,
    contabo_user          = var.contabo_user,
    contabo_pass          = var.contabo_pass,
  }
}

locals {
  contabo_token = data.external.contabo_token.result["contabo_token"]
}

data "http" "contabo_images" {
  url = "https://api.contabo.com/v1/compute/images?size=200"
  request_headers = {
    Authorization = "Bearer ${local.contabo_token}",
    x-request-id  = local.contabo_request_id,
  }
}

locals {
  contabo_instance_types = [
    {
      product_id = "V45",
      product    = "VPS 1 SSD"
      type       = "SSD"
      core       = 4,
      memory     = 6,
      disk       = 400,
      price      = 4.50
    },
    {
      product_id = "V47",
      product    = "VPS 1 Storage"
      type       = "Storage"
      core       = 4,
      memory     = 6,
      disk       = 800,
      price      = 4.50
    },
    {
      product_id = "V46",
      product    = "VPS 1 NVme"
      type       = "NVMe"
      core       = 4,
      memory     = 6,
      disk       = 100,
      price      = 4.50
    },
    {
      product_id = "V48",
      product    = "VPS 2 SSD"
      type       = "SSD"
      core       = 6,
      memory     = 16,
      disk       = 400,
      price      = 9.50
    },
    {
      product_id = "V50",
      product    = "VPS 2 Storage"
      type       = "Storage"
      core       = 6,
      memory     = 16,
      disk       = 800,
      price      = 9.50
    },
    {
      product_id = "V49",
      product    = "VPS 2 NVMe"
      type       = "NVMe"
      core       = 6,
      memory     = 16,
      disk       = 200,
      price      = 9.50
    },
    {
      product_id = "V51",
      product    = "VPS 3 SSD"
      type       = "SSD"
      core       = 6,
      memory     = 24,
      disk       = 1200,
      price      = 14.00
    },
    {
      product_id = "V53",
      product    = "VPS 3 Storage"
      type       = "Storage"
      core       = 6,
      memory     = 24,
      disk       = 2400,
      price      = 14.00
    },
    {
      product_id = "V52",
      product    = "VPS 3 NVMe"
      type       = "NVMe"
      core       = 6,
      memory     = 24,
      disk       = 300,
      price      = 14.00
    },
    {
      product_id = "V54",
      product    = "VPS 4 SSD"
      type       = "SSD"
      core       = 12,
      memory     = 48,
      disk       = 1600,
      price      = 26.00
    },
    {
      product_id = "V56",
      product    = "VPS 4 Storage"
      type       = "Storage"
      core       = 12,
      memory     = 48,
      disk       = 3200,
      price      = 26.00
    },
    {
      product_id = "V55",
      product    = "VPS 4 NVMe"
      type       = "NVMe"
      core       = 12,
      memory     = 48,
      disk       = 400,
      price      = 26.00
    },
    {
      product_id = "V57",
      product    = "VPS 5 SSD"
      type       = "SSD"
      core       = 16,
      memory     = 64,
      disk       = 2000,
      price      = 33.50
    },
    {
      product_id = "V59",
      product    = "VPS 5 Storage"
      type       = "Storage"
      core       = 16,
      memory     = 64,
      disk       = 4000,
      price      = 33.50
    },
    {
      product_id = "V58",
      product    = "VPS 5 NVMe"
      type       = "NVMe"
      core       = 16,
      memory     = 64,
      disk       = 500,
      price      = 33.50
    },
    {
      product_id = "V60",
      product    = "VPS 6 SSD"
      type       = "SSD"
      core       = 24,
      memory     = 120,
      disk       = 2400,
      price      = 61.50
    },
    {
      product_id = "V62",
      product    = "VPS 6 Storage"
      type       = "Storage"
      core       = 24,
      memory     = 120,
      disk       = 4800,
      price      = 61.50
    },
    {
      product_id = "V61",
      product    = "VPS 6 NVMe"
      type       = "NVMe"
      core       = 24,
      memory     = 120,
      disk       = 600,
      price      = 61.50
    },
    {
      product_id = "V8",
      product    = "VDS S"
      type       = "NVMe"
      core       = 3,
      memory     = 24,
      disk       = 180,
      price      = 34.39
    },
    {
      product_id = "V9",
      product    = "VDS M"
      type       = "NVMe"
      core       = 4,
      memory     = 32,
      disk       = 240,
      price      = 44.79
    },
    {
      product_id = "V10",
      product    = "VSS L"
      type       = "NVMe"
      core       = 6,
      memory     = 48,
      disk       = 360,
      price      = 63.99
    },
    {
      product_id = "V11",
      product    = "VDS XL"
      type       = "NVMe"
      core       = 8,
      memory     = 64,
      disk       = 480,
      price      = 82.39
    },
    {
      product_id = "V12",
      product    = "VDS XXL"
      type       = "NVMe"
      core       = 12,
      memory     = 96,
      disk       = 720,
      price      = 119.99
    },
  ]


  contabo_regions = [
    {
      country = "DE",
      name    = "EU",
    },
    {
      country = "US",
      name    = "US-central",
    },
    {
      country = "US",
      name    = "US-east",
    },
    {
      country = "US",
      name    = "US-west",
    },
    {
      country = "SG",
      name    = "SIN",
    },
  ]

  contabo_images    = jsondecode(data.http.contabo_images.response_body).data
  contabo_image_map = merge(var.contabo_image_map...)
  contabo_image     = var.image == null ? null : !contains(keys(local.contabo_image_map), var.image) ? var.image : local.contabo_image_map[var.image]
  contabo_image_map_name_id = {
    for contabo_image in local.contabo_images :
    contabo_image.name => contabo_image.id
  }
  contabo_image_id = var.image == null ? null : local.contabo_image_map_name_id[local.contabo_image]

  contabo_country_regions = [
    for region in local.contabo_regions :
    region if region.country == var.country
  ]
  merged_contabo_preferred_country_regions = merge(var.contabo_preferred_country_regions...)
  contabo_country_location = length(local.contabo_country_regions) == 1 ? local.contabo_country_regions : [
    for region in local.contabo_country_regions :
    region if region.name == lookup(local.merged_contabo_preferred_country_regions, var.country, region.name)
  ]
  contabo_region_name = (
    length(local.contabo_country_regions) == 0 ? null : (
      length(local.contabo_country_regions) == 1 ? local.contabo_country_regions[0].name :
      null
    )
  )
  contabo_instance_types_filtered = [
    for instance_type in local.contabo_instance_types :
    instance_type if instance_type.core >= var.type.vcpus && instance_type.memory >= var.type.ram && instance_type.disk >= var.type.disk
  ]

  contabo_sorted_price_product_id = sort([
    for sever_type in local.contabo_instance_types_filtered :
    "${format("%07.2f", sever_type.price)}#${sever_type.product_id}"
  ])
  contabo_instance_product_id = length(local.contabo_sorted_price_product_id) == 0 ? null : split("#", local.contabo_sorted_price_product_id[0])[1]
}

module "contabo_instance_type" {
  source  = "rhythmictech/errorcheck/terraform"
  version = "~> 1.3.0"

  use_jq        = true
  assert        = length(local.contabo_sorted_price_product_id) > 0
  error_message = "error: no matching server type available"
}

resource "contabo_instance" "instance" {
  count = var.instance ? 1 : 0

  display_name = var.name

  image_id   = local.contabo_image_id
  product_id = local.contabo_instance_product_id
  ssh_keys   = var.ssh_keys
  user_data  = var.user_data
}

resource "contabo_tag" "instance" {
  count = var.instance ? length(var.tags) : 0

  name  = var.tags[count.index]
  color = var.tag_color
}

resource "contabo_tag_assignment" "instance" {
  count = var.instance ? length(var.tags) : 0

  tag_id        = contabo_tag.instance[count.index].id
  resource_type = "instance"
  resource_id   = contabo_instance.instance[0].id
}
