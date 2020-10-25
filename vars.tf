variable "name" {
  description = "Service name"
}

variable "cluster" {
  description = "Cluster name"
}

variable "task_definition" {
  description = "The family, family:revision or ARN of an ECS task definition"
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

variable "load_balancer" {
  description = "Name of a load balancer used to route traffic to the service"
  default     = null
}

variable "load_balancer_arn" {
  description = "ARN of load balancer used to route traffic to the service"
  default     = null
}

variable "load_balancer_port" {
  description = "Port of load balancer used to route traffic to the service"
  default     = 443
}

variable "target_container" {
  description = "Name of the target container for traffic from the specified load balancer"
  default     = null
}

variable "target_port" {
  description = "Port of the target container for traffic from the specified load balancer"
  default     = 80
}

variable "hosts" {
  description = "A list of request host headers used to route traffic to the service (required if load balancer is specified)"
  type        = list(string)
  default     = []
}

variable "paths" {
  description = "A list of request paths used to route traffic to the service"
  type        = list(string)
  default     = []
}

variable "code_deploy_enabled" {
  description = "Use CodeDeploy to manage service deployment"
  default     = false
}

variable "servicediscovery_enabled" {
  description = "Create service discovery private zone for the cluster"
  default     = false
}

variable "namespace_id" {
  description = "Service Discovery namespace"
  default     = null
}

variable "apigateway_enabled" {
  description = "Create an API Gateway endpoint for the cluster"
  default     = false
}

locals {
  lb_count = var.load_balancer != null || var.load_balancer_arn != null ? 1 : 0
}
