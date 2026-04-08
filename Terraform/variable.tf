variable "region" {
  description = "The region of AWS to deploy Travel-memory App."
  type = string
  default = "ap-south-2"
}

variable "AZs_Number" {
  description = "The required Availabilty Zones"
  type = number
  default = 1
}

variable "availability_zone" {
  description = "availibilty zones"
  type = string
}

variable "VPC_CIDR" {
  description = "To define the range of CIDR"
  type = string
}

variable "public-subnet-cidr" {
  description = "CIDR range for public-subnet"
  type = string
}

variable "private-subnet-cidr" {
  description = "CIDR range for private-subnet"
  type = string
}