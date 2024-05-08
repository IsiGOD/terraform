variable "instance_name" {
    type = string
    description = "nombre de la instancia"
    default = "nombre predeterminado"
}

variable "network_name" {
    type = string
    description = "nombre de la red"
    sensitive = true
}

variable "instance_type" {
    type = string
    description = "tipo de instancia a crear"
    default = "t2.micro"
}