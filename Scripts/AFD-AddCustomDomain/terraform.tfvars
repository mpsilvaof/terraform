
frontdoor_profile_name = "nome do frontdoor aqui"  # Nome do perfil do Azure Front Door existente
frontdoor_resource_group_name = "resource grupo name aqui"  # Nome do grupo de recursos do Front Door
dns_resource_group_name       = "resource group name aqui"  # Nome do grupo de recursos da Zona DNS

#Atualize os campos com suas informações
subscription_id = "valor do id aqui" 
client_id     =  "valor do client id aqui" 
client_secret  =  "valor secret aqui"
tenant_id   =    "valor id tenant aqui"

#DNS_zone_ID você deve alterar conforme sua utilização. Os campos são ("IDSUBSCRIPITON";"NOMEDORESOURCEGROUP";"subdomain1.dominioaqui.com.br")
child_zones = [
   {
    domain_name = "subdomain1"
    dns_zone_id = "/subscriptions/IDSUBSCRIPITON/resourceGroups/NOMEDORESOURCEGROUP/providers/Microsoft.Network/dnsZones/subdomain1.dominioaqui.com.br"
  },
  {
    domain_name = "subdomain2"
    dns_zone_id = "/subscriptions/IDSUBSCRIPITON/resourceGroups/NOMEDORESOURCEGROUP/providers/Microsoft.Network/dnsZones/subdomain2.dominioaqui.com.br"
  },
  {
    domain_name = "subdomain3"
    dns_zone_id = "/subscriptions/IDSUBSCRIPITON/resourceGroups/NOMEDORESOURCEGROUP/providers/Microsoft.Network/dnsZones/subdomain3.dominioaqui.com.br"
  },
  {
    domain_name = "subdomain4"
    dns_zone_id = "/subscriptions/IDSUBSCRIPITON/resourceGroups/NOMEDORESOURCEGROUP/providers/Microsoft.Network/dnsZones/subdomain4.dominioaqui.com.br"
  }
]
