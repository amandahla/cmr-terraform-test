data "juju_model" "maubot" {
  name = var.juju_model_name
}

resource "juju_application" "maubot" {
  name  = "maubot"
  model = data.juju_model.maubot.name
  trust = true

  charm {
    name    = "maubot"
    channel = "latest/edge"
  }

  units = 1
}
