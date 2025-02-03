output "postgresql_offer_url" {
  value = juju_offer.postgresql.url
}

output "postgresql_access_id" {
  value = juju_access_offer.postgresql_to_operator.id
}
