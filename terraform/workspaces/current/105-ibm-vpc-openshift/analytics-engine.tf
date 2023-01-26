resource "ibm_resource_instance" "resource_instance" {
  name              = "dev_sf_ae"
  service           = "ibmanalyticsengine"
  plan              = "standard-serverless-spark"
  location          = var.region
  resource_group_id = module.resource_group.id
  tags              = var.ibm-vpc_tags == null ? null : jsondecode(var.ibm-vpc_tags)
  parameters_json   = <<PARAMETERS_JSON
    {
      "num_compute_nodes": "1",
      "hardware_config": "default",
      "software_package": "ae-1.2-hadoop-spark",
      "autoscale_policy": {
      "task_nodes": {
        "num_min_nodes": 1,
        "num_max_nodes": 10,
        "scaleup_rule": {
          "sustained_demand_period_minutes": "10",
          "percentage_of_demand": "50"
        },
        "scaledown_rule": {
          "sustained_excess_period_minutes": "20",
          "percentage_of_excess": "25"
        }
      }
    }
  }
    PARAMETERS_JSON

  timeouts {
    create = "30m"
    update = "15m"
    delete = "15m"
  }
}
