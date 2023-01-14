variable "keycloak_user" {
  type = string
  description = "Usuário para login no Keycloak"
}

variable "keycloak_password" {
  type = string
  description = "Senha para login no Keycloak"
}

variable "database_user" {
  type = string
  description = "Usuário para base de dados"
}

variable "database_password" {
  type = string
  description = "Senha para base de dados"
}
