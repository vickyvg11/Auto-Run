variable "ami-id" {
  type = string
  description = "this is the ami id"
}

variable "type" {
  type = string
  description = "this is the instances type"
}

variable "vpc-cidr-block" {
  type = string
  description = "this is Cidr block for vpc"
}

variable "subnet-1" {
    type = string
    description = "this is Subnet"
}

variable "range" {
  type = string
  description = "this is cidr for route "
}

# variable "gateway-route" {
#   type = string
#   description = "this gateway for route"
# }



variable "rules-sg" {

    type = map(object({
      type = string
      protocol  = string
      from_port = number
      to_port   = number
      cidr_blocks = list(string)
  }))
}

variable "outbound" {

    type = map(object({
      type = string
      protocol  = string
      from_port = number
      to_port   = number
      cidr_blocks = list(string)
  }))
}




variable "user" {
  type = string
}

variable "file-path" {
  type = string
}

variable "destination-path" {
  type = string
}