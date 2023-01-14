module "db" {
  source = "./database"
  vpc_id = module.vpc.vpc_id
  database_user = var.database_user
  database_password = var.database_password
  app_security_group_id = module.keycloak.security_group_id
  db_subnets = module.vpc.database_subnets
}

module "keycloak" {
  source = "./keycloak-service"
  vpc_id = module.vpc.vpc_id
}
