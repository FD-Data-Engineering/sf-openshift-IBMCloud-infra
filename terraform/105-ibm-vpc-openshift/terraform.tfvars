## resource_group_name: The name of the resource group
resource_group_name = "dev_sf_v2"

ibmcloud_api_key = "CJIrsptND5h25n8fF8FSwHcOKkxXjQKatZDzGYM-juLe"

## region: the value of region
region = "eu-de"

## name_prefix: The prefix name for the service. If not provided it will default to the resource group name
name_prefix = "dev_sf_service"

## cluster_name: The name of the ROKS cluster where ODF will be installed
cluster_name = "dev_sf_cluster"

## ocp_version: The version of the ocp cluster to install
ocp_version = "4.10"

## cluster_subnets__count: The number of subnets that should be provisioned per availability zone
cluster_subnets__count = "1"

## worker_count: The number of worker nodes that should be provisioned for classic infrastructure
worker_count = "3"

## cluster_flavor: The machine type that will be provisioned for classic infrastructure
cluster_flavor = "bx2.8x32"

######

## config_banner_text: The text that will appear in the top banner in the cluster
config_banner_text = "DEV Sustainability Cloud"

