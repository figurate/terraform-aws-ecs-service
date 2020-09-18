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

data "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.load_balancer_port
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
    for_each = var.load_balancer_arn != null ? [1] : []
    content {
      container_name   = var.target_container
      container_port   = var.target_port
      target_group_arn = aws_lb_target_group.service.arn
    }
  }

  dynamic "deployment_controller" {
    for_each = var.code_deploy_enabled ? [1] : []
    content {
      type = "CODE_DEPLOY"
    }
  }
}

resource "aws_lb_target_group" "service" {
  count       = var.load_balancer_arn != null ? 1 : 0
  name_prefix = var.name
  vpc_id      = data.aws_vpc.tenant.id
  protocol    = "HTTPS"
  port        = 443
  health_check {
    path     = "/"
    matcher  = "200,301"
    protocol = "HTTPS"
  }
}

resource "aws_lb_listener_rule" "service" {
  listener_arn = data.aws_lb_listener.listener.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service[0].arn
  }
  condition {
    host_header {
      values = var.hosts
    }
    path_pattern {
      values = var.paths
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