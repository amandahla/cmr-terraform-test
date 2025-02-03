data "juju_model" "postgresql" {
  name = var.juju_model_name
}

resource "juju_application" "postgresql" {
  name  = "postgresql"
  model = data.juju_model.postgresql.name
  trust = true

  charm {
    name    = "postgresql-k8s"
    channel = "14/stable"
  }

  config = {
    plugin_hstore_enable  = true
    plugin_pg_trgm_enable = true
  }

  units = 1
}

resource "juju_offer" "postgresql" {
  model            = data.juju_model.postgresql.name
  application_name = juju_application.postgresql.name
  endpoint         = "database"
}

resource "juju_access_offer" "postgresql_to_operator" {
  offer_url = juju_offer.postgresql.url
  consume   = [var.juju_offer_user]
  admin     = ["des-database"]
}
