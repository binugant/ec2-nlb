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
################
variable "nlb_name" {
  type        = string
  description = "Name of the Network Load Balancer"
}

variable "internal" {
  type        = bool
  default     = false
  description = "Whether the NLB is internal"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for NLB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the Target Group will be created"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
}

variable "target_group_port" {
  type        = number
  default     = 80
  description = "Port for the target group"
}

variable "target_group_protocol" {
  type        = string
  default     = "TCP"
  description = "Protocol for the target group"
}

variable "listener_port" {
  type        = number
  default     = 80
  description = "Listener port"
}

variable "listener_protocol" {
  type        = string
  default     = "TCP"
  description = "Listener protocol"
}
