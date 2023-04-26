# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "${path.root}/lib"

  #Core Module
  deploy_core_landing_zones = var.deploy_core_landing_zones

  #Management Module
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources

  #Identity Module
  deploy_identity_resources    = var.deploy_identity_resources
  subscription_id_identity     = data.azurerm_client_config.core.subscription_id
  configure_identity_resources = local.configure_identity_resources

  #Connectivity Module
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = data.azurerm_client_config.core.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources

  #Default Location
  default_location = "westus"

  custom_landing_zones = {
    (var.root_id) = {
      display_name               = var.root_name
      parent_management_group_id = var.tenant_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_root"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-student" = {
      display_name               = "${upper(var.root_id)} Student"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-developer" = {
      display_name               = "${upper(var.root_id)} Developer"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-decommissioned" = {
      display_name               = "${upper(var.root_id)} Decommissioned"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_decommissioned"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-businessunits" = {
      display_name               = "${upper(var.root_id)} Business Units (Prod)"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_businessunits"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-prd-dynamics" = {
      display_name               = "${upper(var.root_id)} Dynamics"
      parent_management_group_id = "${var.root_id}-businessunits"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_dynamics"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-prd-bussolutions" = {
      display_name               = "${upper(var.root_id)} Business Solutions"
      parent_management_group_id = "${var.root_id}-businessunits"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_landing_zones"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-prd-marketing" = {
      display_name               = "${upper(var.root_id)} Marketing"
      parent_management_group_id = "${var.root_id}-businessunits"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_landing_zones"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-prd-managedservices" = {
      display_name               = "${upper(var.root_id)} Managed Services"
      parent_management_group_id = "${var.root_id}-businessunits"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_landing_zones"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-sandboxes" = {
      display_name               = "${upper(var.root_id)} Sandboxes (Dev & QA)"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-dq-dynamics" = {
      display_name               = "${upper(var.root_id)} Dynamics"
      parent_management_group_id = "${var.root_id}-sandboxes"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-dq-bussolutions" = {
      display_name               = "${upper(var.root_id)} Business Solutions"
      parent_management_group_id = "${var.root_id}-sandboxes"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-dq-marketing" = {
      display_name               = "${upper(var.root_id)} Marketing"
      parent_management_group_id = "${var.root_id}-sandboxes"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-dq-managedservices" = {
      display_name               = "${upper(var.root_id)} Managed Services"
      parent_management_group_id = "${var.root_id}-sandboxes"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-platform" = {
      display_name               = "${upper(var.root_id)} Platform"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_platform"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-connectivity" = {
      display_name               = "${upper(var.root_id)} Connectivity"
      parent_management_group_id = "${var.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_connectivity"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-management" = {
      display_name               = "${upper(var.root_id)} Management"
      parent_management_group_id = "${var.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_management"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-identity" = {
      display_name               = "${upper(var.root_id)} Identity"
      parent_management_group_id = "${var.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_identity"
        parameters     = {}
        access_control = {}
      }
    }
  }
}
