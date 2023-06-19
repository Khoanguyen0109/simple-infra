locals {
  cluster_name = var.environment

  eks_deployment = {
    resources_requests_memory = var.resources_requests_memory
    resources_requests_cpu    = var.resources_requests_cpu
    resources_limits_memory   = var.resources_limits_memory
    resources_limits_cpu      = var.resources_limits_cpu
    resources_hpa_cpu         = var.resources_hpa_cpu
    resources_hpa_memory      = var.resources_hpa_memory
    namespace                 = var.environment
    min_replica_count         = var.min_replica_count
    max_replica_count         = var.max_replica_count
  }

  eks_env = {
    environment             = var.environment
    payload_secret          = var.payload_secret
    service_name            = var.service_name
    app_mapp_id             = var.mapp_api_base_url
    mapp_api_base_url       = var.app_mapp_id
    mapp_auth_url           = var.mapp_auth_url
    aws_db_secret_name      = var.database_secret_key
    aws_db_name             = var.database_name
    aws_region              = var.aws_region
    simple_bucket = "simple-${var.environment}"
  }
}
