module "postgresql" {
  source          = "./postgresql-k8s"
  juju_model_name = "des-database"
  juju_offer_user = "des-application"
  providers = {
    juju = juju.database
  }
}

module "maubot" {
  source          = "./maubot-k8s"
  juju_model_name = "des-application"
}


resource "juju_integration" "postgresql_maubot" {
  model = "des-application"

  application {
    name     = module.maubot.application_name
    endpoint = "postgresql"
  }

  application {
    offer_url = module.postgresql.postgresql_offer_url
  }
}
