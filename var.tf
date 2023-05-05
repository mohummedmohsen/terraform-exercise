variable "region" {
  default = "eu-central-1"

}

variable "zone1" {
  default = "eu-central-1a"

}
variable "zone2" {
  default = "eu-central-1b"

}
variable "zone3" {
  default = "eu-central-1c"

}
variable "amis" {
  type = map(any)
  default = {
    eu-central-1 = "ami-03aefa83246f44ef2"
    eu-west-3    = "ami-014571f1593b7be25"
  }

}

variable "user" {
  default = "ec2-user"

}

variable "public_key" {
  default = "mohsenkey.pub"

}

variable "private_key" {
  default = "mohsenkey"

}

variable "MYIP" {
  default = "105.197.250.153"

}