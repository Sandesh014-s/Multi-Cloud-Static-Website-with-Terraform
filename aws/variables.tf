
variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name for static website"
}

variable "index_html" {
  type        = string
  description = "Path to index.html file"
  default     = "index.html"
}
