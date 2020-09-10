variable "name" {
  description = "Service name"
}

variable "cluster" {
  description = "Cluster name"
}

variable "task_definition" {
  description = "ARN of an ECS task definition"
}

variable "vpc_default" {
  description = "Use the default VPC for optional features (e.g. service discovery)"
  default     = true
}

variable "vpc_tags" {
  type        = map(any)
  description = "Lookup tags to identify VPC for optional features (e.g. service discovery)"
  default     = {}
}

variable "security_groups" {
  description = "A list of security group ids applied to the service"
  default     = []
}

variable "published_containers" {
  description = "A map of container name:port to publish to the specified target group"
  type        = map(any)
  default     = {}
}

variable "code_deploy_enabled" {
  description = "Use CodeDeploy to manage service deployment"
  default     = false
}