resource "azurecaf_name" "static_site" {
  name          = var.name
  resource_type = "azurerm_static_site"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_static_site" "static_site" {
  depends_on = [azurerm_static_site_custom_domain.custom_domain]

  name                = azurecaf_name.static_site.result
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags

  sku_size = var.sku_size
  sku_tier = var.sku_tier

  dynamic "identity" {
    for_each = try(var.identity, null) == null ? [] : [1]

    content {
      type         = var.identity.type
      identity_ids = lower(var.identity.type) == "userassigned" ? local.managed_identities : null
    }
  }

  # dynamic "custom_domains" {
  #   for_each = try(var.custom_domains, null) == null ? [] : [1]

  #   content {
  #     domain_name         = var.custom_domains.domain_name
  #     validation_type     = var.custom_domains.validation_type
  #   }
  # }
}
