variable "bucket_name" {
  type        = string
  description = "This is user to pass the bucket name"
  default     = "sajin_bucket"
}

variable "env" {
  type        = string
  description = "This is used to pass the env"
  default     = null
}

variable "filename" {
  type        = string
  description = "Name of the file which contains the reference of the s3 module"
  default     = "not-defined"
}

variable "account" {
  type    = string
  default = "029730857940"
}

variable "block_public_access" {
  type    = bool
  default = true
}

variable "tags" {
  type = object({
    FileName    = string
    Environment = string
  })
  default = {
    FileName    = "notdefined"
    Environment = "dev"
  }
}