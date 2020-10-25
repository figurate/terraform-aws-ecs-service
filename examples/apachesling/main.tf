module "service" {
  source = "../.."

  name            = "apachesling"
  cluster         = var.cluster
  task_definition = var.task_definition
}