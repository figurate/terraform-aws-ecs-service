variable "cluster" {
  description = "Cluster name"
  default     = "example"
}

variable "task_definition" {
  description = "The family, family:revision or ARN of an ECS task definition"
  default     = "nginx"
}

variable "load_balancer" {
  description = "Name of a load balancer used to route traffic to the service"
  default     = "example"
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
  default     = "nginx"
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
