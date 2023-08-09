variable "key_vault_id" {
  description = "Key vault Id"
}

variable "kyv_secrets" {
    type = map(object({
        key_name   = string
        key_value  = string
      }))
}