module "kms" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms?ref=v0.3.6"

  name                   = var.kms_name
  name_prefix            = var.name_prefix
  number_of_crypto_units = var.kms_number_of_crypto_units
  private_endpoint       = var.private_endpoint
  provision              = var.kms_provision
  region                 = var.region
  resource_group_name    = module.resource_group.name
  service                = var.kms_service
  tags                   = concat(var.kms_tags, ["service"])


}

module "sm-key" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms-key?ref=v1.5.4"

  dual_auth_delete              = var.sm-key_dual_auth_delete
  force_delete                  = var.sm-key_force_delete
  kms_id                        = module.kms.guid
  kms_private_url               = module.kms.private_url
  kms_public_url                = module.kms.public_url
  label                         = var.sm-key_label
  name                          = var.sm-key_name
  name_prefix                   = var.name_prefix
  provision                     = var.sm-key_provision
  provision_key_rotation_policy = var.sm-key_provision_key_rotation_policy
  rotation_interval             = var.sm-key_rotation_interval
}

module "ibm-secrets-manager" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-secrets-manager?ref=v1.1.0"

  create_auth         = var.ibm-secrets-manager_create_auth
  ibmcloud_api_key    = var.ibmcloud_api_key
  kms_enabled         = var.ibm-secrets-manager_kms_enabled
  kms_key_crn         = module.sm-key.crn
  label               = var.ibm-secrets-manager_label
  name                = var.ibm-secrets-manager_name
  name_prefix         = var.name_prefix
  private_endpoint    = var.ibm-secrets-manager_private_endpoint
  provision           = var.ibm-secrets-manager_provision
  purge               = var.ibm-secrets-manager_purge
  region              = var.region
  resource_group_name = module.resource_group.name
  trial               = var.ibm-secrets-manager_trial
}
