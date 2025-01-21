
variable "cname_hostnames" {
  description = "Lista de hostnames CNAME a ser criada"
  type        = list(string)
}


variable "subscription_id" {
  description = "The Subscription ID for Azure"
  type        = string
}

variable "client_id" {
  description = "The Client ID for Azure"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for Azure"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Tenant ID for Azure"
  type        = string
}
