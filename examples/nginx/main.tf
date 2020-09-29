module "service" {
  source = "../.."

  name            = "nginx"
  cluster         = var.cluster
  task_definition = var.task_definition
}