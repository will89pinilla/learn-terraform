provider "azurerm" {
  version = "2.14.0"
  features {}
}

locals {
  bastion_rg  = "bastion_rg"
  location  = "westus2"
  bastion_prefix  = "bastion"
}

resource "azurerm_resource_group" "bastion_rg" {
  name            = local.bastion_rg
  location        = local.location  
}

resource "azurerm_public_ip" "bastion_pip" {
  name                =   "${local.bastion_prefix}-public-ip"
  location            =   local.location
  resource_group_name =   azurerm_resource_group.bastion_rg.name
  allocation_method   =   "Static" 
  sku                 =   "Standard"  
}

resource "azurerm_bastion_host" "bastion_host" {
  name = "bastion-host"
  resource_group_name = azurerm_resource_group.bastion_rg.name
  location = local.location

  ip_configuration {
    name        = "us2w"
    subnet_id   = "/subscriptions/2e10606a-6ad7-4bad-9222-e3efba853b0b/resourceGroups/web-rg-us2w/providers/Microsoft.Network/virtualNetworks/web-server-us2w-vnet/subnets/AzureBastionSubnet"
    #subnet_id   = data.terraform_remote_state.web.outputs_bastion_host_subnet_us2w
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
    public_ip_address_id

    
  }
}