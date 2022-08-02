variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "pods_cidr" {
  type = string
}

variable "services_cidr" {
  type = string
}

variable "master_cidr" {
  type = string
}

variable "master_authorized_networks_cidr" {
  type = string
}