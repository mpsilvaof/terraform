variable "client_id" {
  type        = string
  description = "Client ID para autenticação no Azure"
}

variable "client_secret" {
  type        = string
  description = "Client Secret para autenticação no Azure"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID para autenticação no Azure"
}

variable "subscription_id" {
  type        = string
  description = "ID da Subscription no Azure"
}

variable "frontdoor_resource_group_name" {
  description = "Nome do grupo de recursos do Azure Front Door"
  type        = string
}

variable "dns_resource_group_name" {
  description = "Nome do grupo de recursos onde as zonas DNS estão localizadas"
  type        = string
}

variable "frontdoor_profile_name" {
  description = "Nome do perfil do Azure Front Door"
  type        = string
}

variable "child_zones" {
  description = "Lista de zonas DNS filhas"
  type = list(object({
    domain_name = string
    dns_zone_id = string
  }))
}