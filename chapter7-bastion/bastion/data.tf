data "terraform_remote_state" "web" {
    backend = "azurerm"    
    config = {
        resource_group_name  = "remote-state"
        storage_account_name = "udemylearnterraform8907"
        container_name       = "tfstate"
        key                  = "bastion.tfstate"
    }
}