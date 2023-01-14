module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "~> 4.3.0"

  name = "database-sg"
  description = "Grupo de seguranca para a base de dados"
  vpc_id = var.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      source_security_group_id = var.app_security_group_id
    },
  ]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "keycloak-db"
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0"
  major_engine_version = "8.0"
  instance_class    = "db.t2.micro"
  allocated_storage = 5

  name     = "keycloak"
  username = var.database_user
  password = var.database_password
  port     = "3306"

  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids = var.db_subnets
  multi_az = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]
}