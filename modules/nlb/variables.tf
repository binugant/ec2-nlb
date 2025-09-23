variable "name" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "target_ids" {
  type = list(string)
}
variable "listener_port" {}
variable "target_port" {}
