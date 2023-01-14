output "security_group_id" {
  value = module.security_group.security_group_id
  description = "Grupo de segurança criado para a aplicação do Keycloak"
}