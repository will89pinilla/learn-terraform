terraform {
    backend "azurerm" {
        resource_group_name = "remote-state"        
        storage_account_name = "udemylearnterraform8907"
        container_name = "tfstate"
        #key is the name of the state file
        key = "web.tfstate"
    }
    
}