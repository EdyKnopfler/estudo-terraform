variable "vpc_id" {
  type = string
  description = "ID da VPC"
}

variable "app_security_group_id" {
  type = string
  description = "ID do grupo de segurança da aplicação que acessa base de dados"
}

variable "database_user" {
  type = string
  description = "Usuário para base de dados"
}

variable "database_password" {
  type = string
  description = "Senha para base de dados"
}

variable "db_subnets" {
  type = list(string)
  description = "IDs das subredes para a base de dados"
}
