variable "my-ami" {
  type        = string
  default     = ""
  description = "mapping this ami to main.tf"
}

variable "instance-type" {
  type        = string
  default     = ""
  description = "mapping this instancetype to main.tf"
}

variable "key" {
  type        = string
  default     = ""
  description = "mapping this keyname to manin.tf"
}

