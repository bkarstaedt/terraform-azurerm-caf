resource "azurerm_static_site_custom_domain" "custom_domain" {
  static_site_id  = var.static_site_id
  domain_name     = var.domain_name
  validation_type = var.validation_type
}
