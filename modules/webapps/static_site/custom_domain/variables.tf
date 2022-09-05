variable "static_site_id" {
  description = "(Required) The static site id to be associated for this resource."
}

variable "domain_name" {
  description = "(Required) Domain name to be associated for the static site."
  type        = string
}

variable "validation_type " {
  description = "(Required) Validation type to proof domain ownership."
  type        = string

  validation {
    condition     = contains(["cname-delegation", "dns-txt-token"], var.validation_type)
    error_message = "Allowed values are 'cname-delegation' or 'dns-txt-token'."
  }
}
