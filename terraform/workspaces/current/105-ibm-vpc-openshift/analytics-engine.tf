resource "ibm_resource_instance" "resource_instance" {
  name              = "dev_sf_ae"
  service           = "ibmanalyticsengine"
  plan              = "standard-serverless-spark"
  location          = var.region
  resource_group_id = module.resource_group.id
  tags              = var.ibm-vpc_tags == null ? null : jsondecode(var.ibm-vpc_tags)
  parameters_json   = <<PARAMETERS_JSON
  {
  "default_runtime": {
    "spark_version": "3.1"
    },
  "instance_home": {
    "region": "eu-de",
    "endpoint": "https://s3.direct.eu-de.cloud-object-storage.appdomain.cloud",
    "hmac_access_key": "${var.hmac_access_key}",
    "hmac_secret_key": "${var.hmac_secret_key}"
    },
  "default_config": {
    }
}
    PARAMETERS_JSON
  timeouts {
    create = "30m"
    update = "15m"
    delete = "15m"
  }
}
