# a new or existing resource group to create resources
resource "ibm_resource_group" "group" {
  count = var.cos_resource_group_name != "" ? 0 : 1
  name  = "${var.cos_basename}-group"
  tags  = var.cos_instance_tags
}

data "ibm_resource_group" "group" {
  count = var.cos_resource_group_name != "" ? 1 : 0
  name  = var.cos_resource_group_name
}

locals {
  resource_group_id = var.cos_resource_group_name != "" ? data.ibm_resource_group.group.0.id : ibm_resource_group.group.0.id
}

# Create COS instances
resource "ibm_resource_instance" "cos" {
  count             = length(var.cos_instance_names)
  name              = var.cos_instance_names[count.index]
  resource_group_id = local.resource_group_id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  tags              = concat(var.cos_instance_tags, ["service"])
}

# Create Customer buckets
resource "ibm_cos_bucket" "airbus_bucket" {
  count                = length(var.airbus_bucket_names)
  bucket_name          = var.airbus_bucket_names[count.index]
  resource_instance_id = ibm_resource_instance.cos[0].id
  region_location      = var.region
  storage_class        = "smart"
}

resource "ibm_cos_bucket" "gamma_bucket" {
  count                = length(var.gamma_bucket_names)
  bucket_name          = var.gamma_bucket_names[count.index]
  resource_instance_id = ibm_resource_instance.cos[1].id
  region_location      = var.region
  storage_class        = "smart"
}
