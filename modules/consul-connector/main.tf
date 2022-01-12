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
    replicas         = var.replicas
    image_repository = var.image_repository
    image_tag        = var.image_tag

    ambassador_id = jsonencode(var.ambassador_id)
    env           = jsonencode(var.env)
    volumes       = jsonencode(var.volumes)
    volume_mounts = jsonencode(var.volume_mounts)

    pod_security_context = jsonencode(var.pod_security_context)
    security_context     = jsonencode(var.security_context)
    resources            = jsonencode(var.resources)

    autoscaling_enabled                  = var.autoscaling_enabled
    min_replicas                         = var.min_replicas
    max_replicas                         = var.max_replicas
    target_cpu_utilization_percentage    = var.target_cpu_utilization_percentage
    target_memory_utilization_percentage = var.target_memory_utilization_percentage

    affinity    = jsonencode(var.affinity)
    tolerations = jsonencode(var.tolerations)
  }
}

