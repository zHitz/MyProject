variable "REGION" {
  default = "ap-southeast-1"
}

variable "ZONE1" {
  default = "ap-southeast-1a"
}
variable "ZONE2" {
  default = "ap-southeast-1b"

}
variable "ZONE3" {
  default = "ap-southeast-1c"
}
variable "UBUNTU20" {
  default = "ami-04ff9e9b51c1f62ca"
}

### Your PublicIP 
variable "MYIP" {
  default = "$MYIP/32"
}

variable "PUB_KEY" {
  default = "myproject-key.pub"
}
variable USER {
  default = "ubuntu"
}
