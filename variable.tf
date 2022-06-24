variable "security_group_name" {}
variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "eu-west-3"
}

variable "env_details" {
  type = object({
    name: string,
    environment: string
  })
  default = {
    environment = "test"
    name = "geostore"
  }
}

variable "key_name" {}
variable "privateKey_path" {}
