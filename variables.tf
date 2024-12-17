variable "location" {
    description = "Location to deploy to"
    type        = string
    default     = "West Europe"
}

variable "subnet_address_prefixes" {
    description     = "subnet adress space based on workspace"
    type            = map(list(string))
    default         = {
        staging     = ["172.16.35.0/24"]
        production  = ["172.16.35.0/24"]
    }
}

locals {
    selected_subnet_address_prefix = var.subnet_address_prefixes[terraform.workspace]
}