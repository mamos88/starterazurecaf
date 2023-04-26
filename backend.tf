terraform {

    backend "azurerm" {
            resource_group_name  = "tfstate"
            storage_account_name = "tfstatet2k4y"
            container_name       = "tfstate"
            key                  = "landingzone.tfstate"
        }

}