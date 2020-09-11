/**
 * # ![AWS](aws-logo.png) ECS Service
 *
 * Purpose: Blueprints for AWS ECS Service
 *
 * ![AWS ECS Cluster](aws_ecs_service.png)
 */
data "aws_vpc" "tenant" {
  default = var.vpc_default
  tags    = var.vpc_tags
}

data "aws_subnet_ids" "tenant" {
  vpc_id = data.aws_vpc.tenant.id
}

data "aws_ecs_task_definition" "task_definition" {
  task_definition = var.task_definition
}

resource "aws_ecs_service" "service" {
  name                              = var.name
  cluster                           = var.cluster
  desired_count                     = 1
  force_new_deployment              = false
  launch_type                       = "EC2"
  health_check_grace_period_seconds = 60

  dynamic "network_configuration" {
    for_each = data.aws_ecs_task_definition.task_definition.network_mode == "awsvpc" ? [1] : []
    content {
      subnets         = data.aws_subnet_ids.tenant.ids
      security_groups = var.security_groups
    }
  }

  dynamic "load_balancer" {
    for_each = var.target_groups
    content {
      container_name   = split(load_balancer.key, ":")[0]
      container_port   = split(load_balancer.key, ":")[0]
      target_group_arn = load_balancer.value
    }
  }

  dynamic "deployment_controller" {
    for_each = var.code_deploy_enabled ? [1] : []
    content {
      type = "CODE_DEPLOY"
    }
  }
}

resource "aws_service_discovery_service" "service" {
  count        = var.servicediscovery_enabled ? 1 : 0
  name         = var.name
  namespace_id = var.namespace_id
  health_check_custom_config {
    failure_threshold = 1
  }
  dns_config {
    namespace_id   = var.namespace_id
    routing_policy = "WEIGHTED"
    dns_records {
      ttl  = 60
      type = "A"
    }
  }
}