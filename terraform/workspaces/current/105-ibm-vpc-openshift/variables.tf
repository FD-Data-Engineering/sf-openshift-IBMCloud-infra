variable "ibmcloud_api_key" {
  type        = string
  description = "The api key used to access IBM Cloud"
}
variable "region" {
  type        = string
  description = "the value of region"
}
variable "ibm-activity-tracker_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "ibm-activity-tracker_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}
variable "ibm-activity-tracker_sync" {
  type        = string
  description = "Value used to order the provisioning of the instance"
  default     = ""
}
variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}
variable "sysdig_plan" {
  type        = string
  description = "The type of plan the service instance should run under (trial or graduated-tier)"
  default     = "graduated-tier"
}
variable "sysdig_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "sysdig_provision" {
  type        = bool
  description = "Flag indicating that logdna instance should be provisioned"
  default     = true
}
variable "sysdig_name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}
variable "sysdig_label" {
  type        = string
  description = "The label used to build the resource name if not provided."
  default     = "monitoring"
}
variable "sysdig-bind_namespace" {
  type        = string
  description = "The namespace where the agent should be deployed"
  default     = "ibm-observe"
}
variable "sysdig-bind_sync" {
  type        = string
  description = "Semaphore value to sync up modules"
  default     = ""
}
variable "private_endpoint" {
  type        = string
  description = "Flag indicating that the agent should be created with private endpoints"
  default     = "true"
}
variable "logdna_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}
variable "logdna_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "logdna_provision" {
  type        = bool
  description = "Flag indicating that logdna instance should be provisioned"
  default     = true
}
variable "logdna_name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}
variable "logdna_label" {
  type        = string
  description = "The label used to build the resource name if not provided"
  default     = "logging"
}
variable "cluster_name" {
  type        = string
  description = "The name of the cluster that will be created within the resource group"
  default     = ""
}
variable "worker_count" {
  type        = number
  description = "The number of worker nodes that should be provisioned for classic infrastructure"
  default     = 1
}
variable "cluster_flavor" {
  type        = string
  description = "The machine type that will be provisioned for classic infrastructure"
  default     = "bx2.16x64"
}
variable "ocp_version" {
  type        = string
  description = "The version of the OpenShift cluster that should be provisioned (format 4.x)"
  default     = "4.10"
}
variable "cluster_exists" {
  type        = bool
  description = "Flag indicating if the cluster already exists (true or false)"
  default     = false
}
variable "cluster_disable_public_endpoint" {
  type        = bool
  description = "Flag indicating that the public endpoint should be disabled"
  default     = false
}
variable "cluster_ocp_entitlement" {
  type        = string
  description = "Value that is applied to the entitlements for OCP cluster provisioning"
  default     = ""
}
variable "cluster_force_delete_storage" {
  type        = bool
  description = "Attribute to force the removal of persistent storage associtated with the cluster"
  default     = false
}
variable "cluster_tags" {
  type        = string
  description = "Tags that should be added to the instance"
  default     = "[]"
}
variable "cluster_kms_enabled" {
  type        = bool
  description = "Flag indicating that kms encryption should be enabled for this cluster"
  default     = false
}
variable "cluster_kms_id" {
  type        = string
  description = "The crn of the KMS instance that will be used to encrypt the cluster."
  default     = null
}
variable "cluster_kms_key_id" {
  type        = string
  description = "The id of the root key in the KMS instance that will be used to encrypt the cluster."
  default     = null
}
variable "cluster_kms_private_endpoint" {
  type        = bool
  description = "Flag indicating that the private endpoint should be used to connect the KMS system to the cluster."
  default     = true
}
variable "cluster_login" {
  type        = bool
  description = "Flag indicating that after the cluster is provisioned, the module should log into the cluster"
  default     = false
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "resource_group_sync" {
  type        = string
  description = "Value used to order the provisioning of the resource group"
  default     = ""
}
variable "purge_volumes" {
  type        = bool
  description = "Flag indicating that any volumes in the resource group should be automatically destroyed before destroying the resource group. If volumes exist and the flag is false then the destroy will fail."
  default     = false
}
variable "ibm-vpc_name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}
variable "ibm-vpc_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}
variable "ibm-vpc_address_prefix_count" {
  type        = number
  description = "The number of ipv4_cidr_blocks"
  default     = 0
}
variable "ibm-vpc_address_prefixes" {
  type        = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[]"
}
variable "ibm-vpc_base_security_group_name" {
  type        = string
  description = "The name of the base security group. If not provided the name will be based on the vpc name"
  default     = ""
}
variable "ibm-vpc_internal_cidr" {
  type        = string
  description = "The cidr range of the internal network"
  default     = "10.0.0.0/8"
}
variable "ibm-vpc_tags" {
  type        = string
  description = "Tags that should be added to the instance"
  default     = "[]"
}
variable "ibm-vpc-gateways_provision" {
  type        = bool
  description = "Flag indicating that the gateway must be provisioned"
  default     = true
}
variable "ibm-vpc-gateways_tags" {
  type        = string
  description = "Tags that should be added to the instance"
  default     = "[]"
}
variable "cluster_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "cluster_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}
variable "cluster_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "default"
}
variable "cluster_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[]"
}
variable "cluster_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "cluster_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "cluster_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "cluster_subnets_tags" {
  type        = string
  description = "Tags that should be added to the instance"
  default     = "[]"
}
variable "cos_resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}
variable "cos_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}
variable "cos_provision" {
  type        = bool
  description = "Flag indicating that cos instance should be provisioned"
  default     = true
}
variable "cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "cos"
}

variable "cos_instance_tags" {
  type    = list(string)
  default = ["terraform", "dev_sf"]
}

variable "cos_basename" {
  type    = string
  default = ""
}

variable "cos_resource_group_name" {
  type    = string
  default = ""
}

variable "cos_instance_names" {
  type    = list(any)
  default = ["Airbus", "Gamma", "PACE"]
}

variable "airbus_bucket_names" {
  type    = list(any)
  default = ["ingestedairbusdata", "publishedairbusdata", "transformedairbusdata"]
}

variable "gamma_bucket_names" {
  type    = list(any)
  default = ["ingestedgammadata", "publishedgammadata", "transformedgammadata"]
}

variable "pace_bucket_names" {
  type    = list(any)
  default = ["ingestedpacedata", "publishedpacedata", "transformedpacedata"]
}

variable "hmac_access_key" {
  default = ""
}

variable "hmac_secret_key" {
  default = ""
}

variable "ibm-secrets-manager_create_auth" {
  type        = bool
  description = "Flag indicating the service authorization should be created to allow this service to access the KMS service"
  default     = true
}

variable "ibm-secrets-manager_kms_enabled" {
  type        = bool
  description = "Flag indicating that kms encryption should be enabled for this instance"
  default     = true
}

variable "ibm-secrets-manager_label" {
  type        = string
  description = "Label used to build the Secrets Manager name if not provided."
  default     = "sm"
}

variable "ibm-secrets-manager_name" {
  type        = string
  description = "Name of the Secrets Manager. If not provided will be generated as $name_prefix-$label"
  default     = ""
}

variable "ibm-secrets-manager_private_endpoint" {
  type        = bool
  description = "Flag indicating that the service should be access using private endpoints"
  default     = false
}

variable "ibm-secrets-manager_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

variable "ibm-secrets-manager_purge" {
  type        = bool
  description = "Flag indicating whether the instance should be purged from reclamation on destroy"
  default     = false
}

variable "ibm-secrets-manager_trial" {
  type        = bool
  description = "Flag indicating whether the instance to be deployed is to be a trial plan. "
  default     = false
}

variable "sm-key_dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}

variable "sm-key_force_delete" {
  type        = bool
  description = "Flag indicating that 'force' should be applied to key on delete"
  default     = true
}

variable "sm-key_label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key"
}

variable "sm-key_name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = ""
}

variable "sm-key_provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = true
}
variable "sm-key_provision_key_rotation_policy" {
  type        = bool
  description = "Flag indicating that the key rotation policy should be provisioned. If false then a rotation policy will not be created."
  default     = false
}

variable "sm-key_rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
}

variable "kms_name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "kms_number_of_crypto_units" {
  type        = number
  description = "No of crypto units that has to be attached to the instance."
  default     = 2
}

variable "kms_provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}

variable "kms_service" {
  type        = string
  description = "The name of the KMS provider that should be used (keyprotect or hpcs)"
  default     = "keyprotect"
}

variable "kms_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = ["terraform", "dev_sf"]
}

variable "vm1_ssh_key" {
  default = "dev-sf-elk-vm1"
}


####################################################################################################

# variable "service_name" {
#   type        = string
#   description = "Resource instance name for example, my Database instance"
#   default     = "databases-for-elasticsearch"
# }
# variable "plan" {
#   type        = string
#   description = "The plan type of the Database instance"
#   default     = "standard"
# }

# variable "adminpassword" {
#   default     = null
#   type        = string
#   description = "The admin user password for the instance"
# }
# variable "database_version" {
#   default     = null
#   type        = string
#   description = "The database version to provision if specified"
# }
# variable "memory_allocation" {
#   default     = 3072
#   type        = number
#   description = "Memory allocation required for database"
# }
# variable "disk_allocation" {
#   default     = 30720
#   type        = number
#   description = "Disk allocation required for database"
# }
# variable "cpu_allocation" {
#   default     = 9
#   type        = number
#   description = "CPU allocation required for database"
# }
# variable "service_endpoints" {
#   default     = "public-and-private"
#   type        = string
#   description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
# }
# variable "backup_id" {
#   default     = null
#   type        = string
#   description = "The CRN of backup source database"
# }
# variable "remote_leader_id" {
#   default     = null
#   type        = string
#   description = "The CRN of leader database"
# }
# variable "kms_instance" {
#   default     = null
#   type        = string
#   description = "The CRN of Key protect instance"
# }
# variable "disk_encryption_key" {
#   default     = null
#   type        = string
#   description = "The CRN of Key protect key"
# }
# variable "backup_encryption_key" {
#   default     = null
#   type        = string
#   description = "The Backup Encryption Key CRN"
# }
# variable "tags" {
#   default     = null
#   type        = set(string)
#   description = "Tags for the database"
# }
# variable "point_in_time_recovery_deployment_id" {
#   default     = null
#   type        = string
#   description = "The CRN of source instance"
# }
# variable "point_in_time_recovery_time" {
#   default     = null
#   type        = string
#   description = "The point in time recovery time stamp of the deployed instance"
# }
# variable "users" {
#   default     = null
#   type        = set(map(string))
#   description = "Database Users. It is set of username and passwords"
# }
# variable "whitelist" {
#   default     = null
#   type        = set(map(string))
#   description = "Database Whitelist It is set of IP Address and description"
# }
# variable "cpu_rate_increase_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling CPU Rate: Increase Percent"
# }
# variable "cpu_rate_limit_count_per_member" {
#   default     = null
#   type        = number
#   description = "Auto Scaling CPU Rate: Limit count per number"
# }
# variable "cpu_rate_period_seconds" {
#   default     = null
#   type        = number
#   description = "Auto Scaling CPU Rate: Period Seconds"
# }
# variable "cpu_rate_units" {
#   default     = null
#   type        = string
#   description = "Auto Scaling CPU Rate: Units "
# }
# variable "disk_capacity_enabled" {
#   default     = null
#   type        = bool
#   description = "Auto Scaling Disk Scalar: Capacity Enabled"
# }
# variable "disk_free_space_less_than_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Disk Scalar: Capacity Free Space Less Than Percent"
# }
# variable "disk_io_above_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Disk Scalar: IO Utilization Above Percent"
# }
# variable "disk_io_enabled" {
#   default     = null
#   type        = bool
#   description = "Auto Scaling Disk Scalar: IO Utilization Enabled"
# }
# variable "disk_io_over_period" {
#   default     = null
#   type        = string
#   description = "Auto Scaling Disk Scalar: IO Utilization Over Period"
# }
# variable "disk_rate_increase_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Disk Rate: Increase Percent"
# }
# variable "disk_rate_limit_mb_per_member" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Disk Rate: Limit mb per member"
# }
# variable "disk_rate_period_seconds" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Disk Rate: Period Seconds"
# }
# variable "disk_rate_units" {
#   default     = null
#   type        = string
#   description = "Auto Scaling Disk Rate: Units "
# }
# variable "memory_io_above_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Memory Scalar: IO Utilization Above Percent"
# }
# variable "memory_io_enabled" {
#   default     = null
#   type        = bool
#   description = "Auto Scaling Memory Scalar: IO Utilization Enabled"
# }
# variable "memory_io_over_period" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Memory Scalar: IO Utilization Over Period"
# }
# variable "memory_rate_increase_percent" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Memory Rate: Increase Percent"
# }
# variable "memory_rate_limit_mb_per_member" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Memory Rate: Limit mb per member"
# }
# variable "memory_rate_period_seconds" {
#   default     = null
#   type        = number
#   description = "Auto Scaling Memory Rate: Period Seconds"
# }
# variable "memory_rate_units" {
#   default     = null
#   type        = string
#   description = "Auto Scaling Memory Rate: Units "
# }
