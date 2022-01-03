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
    name_override = var.name_override != null ? var.name_override : ""

    replicas  = var.replicas
    daemonset = var.daemonset

    image_repository = var.image_repository
    image_tag        = var.image_tag

    test_enabled = var.test_enabled
    test_image   = var.test_image

    hpa_enabled      = var.hpa_enabled
    hpa_min_replicas = var.hpa_min_replicas
    hpa_max_replicas = var.hpa_max_replicas
    hpa_metrics      = jsonencode(var.hpa_metrics)

    pod_disruption_budget = jsonencode(var.pod_disruption_budget)

    namespace_env = var.namespace_env != null ? yamlencode({
      namespace = { name = var.namespace_env }
    }) : ""
    single_namespace = var.single_namespace
    env              = jsonencode(var.env)
    env_raw          = jsonencode(var.env_raw)

    pod_security_context       = jsonencode(var.pod_security_context)
    container_security_context = jsonencode(var.container_security_context)

    host_network = var.host_network

    service_type                = var.service_type
    ports                       = jsonencode(var.ports)
    external_traffic_policy     = var.external_traffic_policy
    session_affinity            = var.session_affinity
    session_affinity_config     = jsonencode(var.session_affinity_config)
    external_ips                = jsonencode(var.external_ips)
    load_balancer_ip            = var.load_balancer_ip
    load_balancer_source_ranges = jsonencode(var.load_balancer_source_ranges)
    service_annotations         = jsonencode(var.service_annotations)

    admin_service_create      = var.admin_service_create
    admin_service_type        = var.admin_service_type
    admin_service_port        = var.admin_service_port
    admin_snapshot_port       = var.admin_snapshot_port
    admin_service_node_port   = var.admin_service_node_port
    admin_service_annotations = jsonencode(var.admin_service_annotations)

    rbac_create        = var.rbac_create
    rbac_psp           = jsonencode(var.rbac_psp)
    rbac_name_override = var.rbac_name_override

    service_account_create = var.service_account_create
    service_account_name   = var.service_account_name

    restart_policy                   = var.restart_policy
    termination_grace_period_seconds = var.termination_grace_period_seconds

    init_containers    = jsonencode(var.init_containers)
    sidecar_containers = jsonencode(var.sidecar_containers)
    liveness_probe     = jsonencode(var.liveness_probe)
    readiness_probe    = jsonencode(var.readiness_probe)

    volumes                = jsonencode(var.volumes)
    volume_mounts          = jsonencode(var.volume_mounts)
    pod_labels             = jsonencode(var.pod_labels)
    pod_annotations        = jsonencode(var.pod_annotations)
    deployment_labels      = jsonencode(var.deployment_labels)
    deployment_annotations = jsonencode(var.deployment_annotations)

    resources           = jsonencode(var.resources)
    priority_class_name = var.priority_class_name
    tolerations         = jsonencode(var.tolerations)
    affinity            = jsonencode(var.affinity)

    topology_spread_constraints = jsonencode(var.topology_spread_constraints)

    ambassador_config = jsonencode(var.ambassador_config)

    endpoint_resolver_create = var.endpoint_resolver_create
    endpoint_resolver_name   = var.endpoint_resolver_name

    consul_resolver_create = var.consul_resolver_create
    consul_resolver_name   = var.consul_resolver_create
    consul_resolver_spec   = var.consul_resolver_spec != null ? jsonencode(var.consul_resolver_spec) : "{}"

    create_default_listeners = var.create_default_listeners
  }
}

