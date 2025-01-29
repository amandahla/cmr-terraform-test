# juju_access_offer and CMR test plan

# Steps

## Run commands

```
juju add-model des-application
juju add-model des-database
juju add-user des-application
juju add-user des-database
juju grant des-application admin des-application
juju grant des-database admin des-database
juju change-user-password des-application
juju change-user-password des-database
```

## Create providers.tf file

Content can be extracted from `juju show-controller` output.

```
provider "juju" {
  alias                = "database"
  controller_addresses = "1.1.1.1:17070"
  username             = "des-database"
  password             = "superpassword"
  ca_certificate       = file("./ca-cert.pem")
}

provider "juju" {
  controller_addresses = "1.1.1.1:17070"
  username             = "des-application"
  password             = "superpassword"
  ca_certificate       = file("./ca-cert.pem")
}
```

## Clone the terraform plan and run terraform

```
cd cmr-terraform-test
terraform init
terraform plan
terraform apply
```
