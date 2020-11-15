variable "cluster" {
  description = "Cluster name"
}

variable "task_definition" {
  description = "The family, family:revision or ARN of an ECS task definition"
}

variable "servicediscovery_enabled" {
  description = "Create service discovery private zone for the cluster"
  default     = false
}

variable "namespace_id" {
  description = "Service Discovery namespace"
  default     = null
}
