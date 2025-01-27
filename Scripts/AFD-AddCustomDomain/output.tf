output "custom_domains" {
  value = azurerm_cdn_frontdoor_custom_domain.child_zones_apex_domain
  description = "Lista de domínios personalizados criados"
}
