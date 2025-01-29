variable "juju_model_name" {
  description = "Juju model name"
  type        = string
}

variable "juju_controller_name" {
  description = "Juju controller name"
  type        = string
  default = ""
}

variable "juju_offer_user" {
  description = "Juju user that will be created for sharing the offer"
  type        = string
  default = "admin"
}
