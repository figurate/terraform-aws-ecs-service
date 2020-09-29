variable "cluster" {
  description = "Cluster name"
  default     = "example"
}

variable "task_definition" {
  description = "The family, family:revision or ARN of an ECS task definition"
  default     = "example-nginx-default"
}
