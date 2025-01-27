terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.2.0"
    }
  }
}

provider "azurerm" {
  alias           = "frontdoor"
  features {}  
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

provider "azurerm" {
  alias           = "dns"
  features {}  
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Perfil do Azure Front Door existente (usando o provedor "frontdoor")
data "azurerm_cdn_frontdoor_profile" "existing_profile" {
  provider            = azurerm.frontdoor
  name                = var.frontdoor_profile_name
  resource_group_name = var.frontdoor_resource_group_name
}

# Adicionar domínios personalizados de zonas filhas (usando os dns_zone_id fornecidos)
resource "azurerm_cdn_frontdoor_custom_domain" "child_zones_apex_domain" {
  provider                 = azurerm.frontdoor
  for_each                 = { for domain in var.child_zones : domain.domain_name => domain }
  name                     = each.key
  cdn_frontdoor_profile_id = data.azurerm_cdn_frontdoor_profile.existing_profile.id
  dns_zone_id              = each.value.dns_zone_id  # Utilizando o dns_zone_id fornecido em terraform.tfvars
  
  # Validando que host_name fique com nome completo   
  #  Você deve alterar o campo "dominioaqui.com.br" para o que for utilizar
  host_name                = "${each.value.domain_name}.dominioaqui.com.br" 

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }

  depends_on = [
    data.azurerm_cdn_frontdoor_profile.existing_profile  # valida que o perfil frontdoor antes de associar o dominio
  ]
}
