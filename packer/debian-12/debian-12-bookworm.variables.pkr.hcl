variable "iso_url" {
  type    = string
  default = "https://cdimage.debian.org/debian-cd/12.9.0/amd64/iso-cd/debian-12.9.0-amd64-netinst.iso"
}

variable "iso_storage_pool" {
  type = string
  default = "local"
}

variable "iso_checksum" {
  type    = string
  default = "sha512:9ebe405c3404a005ce926e483bc6c6841b405c4d85e0c8a7b1707a7fe4957c617ae44bd807a57ec3e5c2d3e99f2101dfb26ef36b3720896906bdc3aaeec4cd80"
}

variable "vmid" {
  type        = string
  description = "Proxmox Template ID"
  default     = "1000"
}

variable "cpu_type" {
  type    = string
  default = "kvm64"
}

variable "cores" {
  type    = string
  default = "2"
}

variable "disk_format" {
  type    = string
  default = "raw"
}

variable "disk_size" {
  type    = string
  default = "32G"
}

variable "storage_pool" {
  type    = string
  default = "local"
}

variable "memory" {
  type    = string
  default = "6144"
}

variable "network_vlan" {
  type = string
  default = ""
}

variable "proxmox_api_password" {
  type      = string
  sensitive = true
}

variable "proxmox_api_user" {
  type    = string
}

variable "proxmox_host" {
  type    = string
}

variable "proxmox_node" {
  type    = string
}