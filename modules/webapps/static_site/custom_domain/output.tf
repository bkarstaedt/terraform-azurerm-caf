output "id" {
  value       = azurerm_static_site_custom_domain.custom_domain.id
  description = "The ID of the Static Site Custom Domain."
}

output "validation_token" {
  value       = azurerm_static_site_custom_domain.custom_domain.validation_token
  description = "Token to be used with 'dns-txt-token' validation."
}
