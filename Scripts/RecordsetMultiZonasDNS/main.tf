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

#Recordset CNAME para cada zona dns
resource "azurerm_dns_cname_record" "cname-record" {
  for_each            = toset(var.zones)  
  name                = "value_host"   #preencha aqui nome host do recordset         
  zone_name           = each.value         
  resource_group_name = "resource_group_name"  #preenchi aqui o valor do seu resource group    
  ttl                 = 3600              
  record              = "value_recordname"     #preenchi aqui o valor do recordset      
}
