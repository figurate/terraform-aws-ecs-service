module "service" {
  source = "../.."

  name               = "nginx"
  cluster            = var.cluster
  task_definition    = var.task_definition
  load_balancer      = var.load_balancer
  load_balancer_arn  = var.load_balancer_arn
  load_balancer_port = var.load_balancer_port
  target_container   = var.target_container
  target_port        = var.target_port
  hosts              = var.hosts
  paths              = var.paths
}