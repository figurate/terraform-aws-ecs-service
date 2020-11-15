module "service" {
  source = "../.."

  name                     = "apachesling"
  cluster                  = var.cluster
  task_definition          = var.task_definition
  servicediscovery_enabled = var.servicediscovery_enabled
  namespace_id             = var.namespace_id
}