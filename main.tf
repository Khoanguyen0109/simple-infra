module "simple-web-app" {
  aws_region                = var.aws_region
  min_replica_count         = var.min_replica_count
  max_replica_count         = var.max_replica_count
  resources_requests_memory = var.resources_requests_memory
  resources_requests_cpu    = var.resources_requests_cpu
  resources_limits_memory   = var.resources_limits_memory
  resources_limits_cpu      = var.resources_limits_cpu
  resources_hpa_cpu         = var.resources_hpa_cpu
  resources_hpa_memory      = var.resources_hpa_memory


  providers = {
    kubernetes = kubernetes.eks
  }
}
