resource "helm_release" "release" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version
  namespace  = var.chart_namespace

  max_history = var.max_history
  timeout     = var.chart_timeout

  values = [
    templatefile("${path.module}/templates/values.yaml", local.values),
  ]
}

locals {
  values = {
    replicas  = var.replicas
    daemonset = var.daemonset

    image_repository = var.image_repository

    test_enabled = var.test_enabled
    test_image   = var.test_image

    hpa_enabled      = var.hpa_enabled
    hpa_min_replicas = var.hpa_min_replicas
    hpa_max_replicas = var.hpa_max_replicas
    hpa_metrics      = jsonencode(var.hpa_metrics)

    pod_disruption_budget = jsonencode(var.pod_disruption_budget)

    namespace_env    = var.namespace_env != null ? var.namespace_env : "null"
    single_namespace = var.single_namespace
    env              = jsonencode(var.env)
    env_raw          = jsonencode(var.env_raw)

    pod_security_context       = jsonencode(var.pod_security_context)
    container_security_context = jsonencode(var.container_security_context)

    host_network = var.host_network

    service_type            = var.service_type
    ports                   = jsonencode(var.ports)
    external_traffic_policy = var.external_traffic_policy
    session_affinity        = var.session_affinity
    session_affinity_config = jsonencode(var.session_affinity_config)
    external_ips            = jsonencode(var.external_ips)
    service_annotations     = jsonencode(var.service_annotations)

    admin_service_create      = var.admin_service_create
    admin_service_type        = var.admin_service_type
    admin_service_port        = var.admin_service_port
    admin_service_node_port   = var.admin_service_node_port
    admin_service_annotations = jsonencode(var.admin_service_annotations)

    rbac_create        = var.rbac_create
    rbac_psp           = jsonencode(var.rbac_psp)
    rbac_name_override = var.rbac_name_override

    service_account_create = var.service_account_create
    service_account_name = var.service_account_name
  }
}

