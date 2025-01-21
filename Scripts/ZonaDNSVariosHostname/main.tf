terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.2.0"
    }
  }
}

# Definição do provedor Azure
provider "azurerm" {
  features {}

 
  # Autenticação usando variáveis
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Recordsets CNAME com hostname diferentes
resource "azurerm_dns_cname_record" "cname_record" {
  for_each            = { for hostname in var.cname_hostnames : 
                            hostname => hostname }

  name                = "${each.value}"  
  zone_name           = "xxxxxx"    #preencher com o nome da zone de dns             
  resource_group_name = "xxxxxxx"       #preencher com o nome do resource group             
  ttl                 = 3600                          
  record              = "xxxxxx"   #preencher com o valor que será apontado                  
}