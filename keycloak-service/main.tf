module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "~> 4.3.0"

  name = "keycloak-sg"
  description = "Grupo de seguranca para o Keycloak"
  vpc_id = var.vpc_id
}

