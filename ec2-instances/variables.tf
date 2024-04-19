variable "region" {
  description = "AWS Resoure region"
  default     = "us-east-2"
  type        = string
}

variable "environment" {
  description = "Environemnt"
  type        = string
  default     = "dev"
}

variable "app-group" {
  type        = string
  description = "Application team group"
  default     = "research"

}