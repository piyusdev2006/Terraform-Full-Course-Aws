# defining varibale
variable "environment" {
  default     = "dev"
  type        = string
}

# variable of type string
variable "region" {
  type = string
  description = "The AWS region to deploy resources in"
  default = "us-east-1"
}

# variable of type number
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

# variable of type bool
variable "monitoring"{
  description = "Enable detailed monitoring for EC2 instances"
  type = bool
  default = true
}

# variable of type bool
variable "associate_public_ip" {
  description = "Associate a public IP address with the EC2 instances"
  type = bool
  default = true
}

# variable of type list
variable "cidr_blocks" {
  description = "List of CIDR blocks allowed to access the instance over TLS"
  type        = list(string)
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  
}

# variable of type list
variable "vm_types" {
  description = "types of VM's listed"
  type = list(string)
  default = [ "t2.micro", "t2.small", "t3.micro", "t3.small" ]
}

# variable of type set
variable "available_regions"{
  description = "List of available AWS regions"
  type        = set(string)
  default     = ["us-east-1", "us-west-1", "us-west-2", "eu-west-1", "eu-central-1", "us-west-1"]
}

# variable of type map
variable "tags"{
  description = "A map of tags to assign to resources"
  type = map(string)
  default = {
    Environment = "dev"
    Name = "Dev-EC2-instance"
    created_by = "terraform"
  }
}

# variable of type tuple
variable "ingress_value" {
  description = "A tuple representing ingress rule values"
  type = tuple([ number, string, number ])
  default = [ 443, "tcp", 443 ]
}


# variable of type object
variable "config" {
  description = "Configuration o"
  type = object({
    region = string
    monitoring = bool
    instance_count = number
  })
  default = {
    region = "us-east-1"
    monitoring = true
    instance_count = 1
  }
}