variable "release_name" {
  description = "Helm release name"
  default     = "emissary-ingress"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "emissary-ingress"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://app.getambassador.io"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "7.2.0"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "ambassador"
}

variable "chart_timeout" {
  description = "Timeout to wait for the Chart to be deployed."
  default     = 300
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

variable "manage_crd" {
  description = "Manage the CRD for Emissary Ingress"
  type        = bool
  default     = false
}

variable "crd_manifest" {
  description = "Provide a custom CRD Manifest to be created. Otherwise, the version corresponding to var.image_tag will be used"
  type        = string
  default     = null
}

#######################
# Chart Values
#######################
variable "name_override" {
  description = "Override name of generated service"
  type        = string
  default     = null
}

variable "replicas" {
  description = "Number of replicas"
  default     = 3
}

variable "daemonset" {
  description = "Deploy as a DaemonSet"
  default     = false
}

variable "image_repository" {
  # gcr.io/datawire/emissary
  # docker.io/emissaryingress/emissary

  description = "Docker image repository"
  default     = "gcr.io/datawire/emissary"
}

variable "image_tag" {
  description = "Docker image tag"
  default     = "2.1.0"
}

variable "test_enabled" {
  description = "Deploy a test pod to test deployment"
  default     = true
}

variable "test_image" {
  description = "Image used for test pod"
  default     = "busybox"
}

variable "hpa_enabled" {
  description = "Enable HorizontalPodAutoscaler"
  default     = false
}

variable "hpa_min_replicas" {
  description = "Min number of replicas for HPA scaling"
  default     = 2
}

variable "hpa_max_replicas" {
  description = "Min number of replicas for HPA scaling"
  default     = 5
}

variable "hpa_metrics" {
  description = "Metrics for HPA Scaling"
  default = [
    {
      type = "Resource"
      resource = {
        name = "cpu"
        target = {
          type               = "Utilization"
          averageUtilization = 60
        }
      }
    },
    {
      type = "Resource"
      resource = {
        name = "memory"
        target = {
          type               = "Utilization"
          averageUtilization = 60
        }
      }
    },
  ]
}

variable "pod_disruption_budget" {
  description = "Pod Disruption budget"
  default     = {}
}

variable "namespace_env" {
  description = "Set the AMBASSADOR_NAMESPACE environment variable"
  default     = null
}

variable "env" {
  description = "Additional environment variables"
  default     = {}
}

variable "env_raw" {
  description = "'Raw' container environment variables in YAML"
  type        = string
  default     = ""
}

variable "pod_security_context" {
  description = "Pod Security Context"
  default = {
    runAsUser = 8888
  }
}

variable "container_security_context" {
  description = "Container security context"
  default = {
    allowPrivilegeEscalation = false
  }
}

variable "host_network" {
  description = "Use host networking"
  default     = false
}

variable "service_type" {
  description = "Service Type"
  default     = "LoadBalancer"
}

variable "ports" {
  description = "Service Ports"
  default = [
    {
      name       = "http"
      port       = 80
      targetPort = 8080
    },
    {
      name       = "https"
      port       = 443
      targetPort = 8443
    },
  ]
}

variable "external_traffic_policy" {
  description = "Load balancer external traffic policy"
  default     = "Local"
}

variable "session_affinity" {
  description = "Session affinity, if any"
  default     = "None"
}

variable "session_affinity_config" {
  description = "Session affinity config"
  default     = {}
}

variable "external_ips" {
  description = "External IPs for the service"
  default     = []
}

variable "load_balancer_ip" {
  description = "LoadBalancer IP, if supported by the cloud provider"
  default     = ""
}

variable "load_balancer_source_ranges" {
  description = "List of CIDRs that the load balancer will accept traffic from"
  default     = []
}

variable "service_annotations" {
  description = "Annotation for the service"
  default     = {}
}

variable "admin_service_create" {
  description = "Create admin service"
  default     = true
}

variable "admin_service_type" {
  description = "Service type for admin service"
  default     = "ClusterIP"
}

variable "admin_service_port" {
  description = "Port for admin service"
  default     = 8877
}

variable "admin_snapshot_port" {
  description = "Port for admin snapshot"
  type        = number
  default     = 8005
}

variable "admin_service_node_port" {
  description = "odePort used if type is NodePort"
  default     = 38877
}

variable "admin_service_annotations" {
  description = "Annotations for admin service"
  default     = {}
}

variable "rbac_create" {
  description = "Create RBAC resources"
  default     = true
}

variable "rbac_psp" {
  description = "List of PSP to enable usage of"
  default     = []
}

variable "rbac_name_override" {
  description = "Name of the RBAC resources defaults to the name of the release. Set nameOverride when installing Ambassador with cluster-wide scope in different namespaces with the same release name to avoid conflicts."
  default     = ""
}

variable "single_namespace" {
  description = "tells Ambassador to only use resources in the namespace or namespace set by namespace.name"
  default     = false
}

variable "service_account_create" {
  description = "Create service account"
  default     = true
}

variable "service_account_name" {
  description = "Override service account name"
  default     = ""
}

variable "restart_policy" {
  description = "Restart policy for pods"
  default     = ""
}

variable "termination_grace_period_seconds" {
  description = "Termination grace period"
  default     = ""
}

variable "init_containers" {
  description = "Custom init containers"
  default     = []
}

variable "sidecar_containers" {
  description = "Custom Sidecar containers"
  default     = []
}

variable "liveness_probe" {
  description = "Liveness Probe configuration"
  default = {
    initialDelaySeconds = 30
    periodSeconds       = 3
    failureThreshold    = 3
  }
}

variable "readiness_probe" {
  description = "Readiness probe configuration"
  default = {
    initialDelaySeconds = 30
    periodSeconds       = 3
    failureThreshold    = 3
  }
}

variable "volumes" {
  description = "Additional volumes"
  default     = []
}

variable "volume_mounts" {
  description = "Additional volume mounts"
  default     = []
}

variable "pod_labels" {
  description = "Labels for pods"
  default     = {}
}

variable "pod_annotations" {
  description = "Pod annotations"
  default     = {}
}

variable "deployment_labels" {
  description = "Labels for deployments"
  default     = {}
}

variable "deployment_annotations" {
  description = "Deploymoent annotations"
  default     = {}
}

variable "resources" {
  description = "Pod resources"
  default = {
    requests = {
      cpu    = "200m"
      memory = "600Mi"
    }
    limits = {
      cpu    = "1000m"
      memory = "600Mi"
    }
  }
}

variable "priority_class_name" {
  description = "Priority class names"
  default     = ""
}

variable "tolerations" {
  description = "Pod tolerations"
  default     = []
}

variable "affinity" {
  description = "Pod affinity"
  default     = {}
}

variable "topology_spread_constraints" {
  description = "Topology Spread Constraints for pods"
  default     = []
}

variable "ambassador_config" {
  description = "Ambassador Config"
  default     = ""
}

variable "endpoint_resolver_create" {
  description = "Create endpoint resolver. See https://www.getambassador.io/docs/latest/topics/running/resolvers/"
  type        = bool
  default     = false
}

variable "endpoint_resolver_name" {
  description = "Name of endpoint resolver"
  type        = string
  default     = "endpoint"
}

variable "consul_resolver_create" {
  description = "Create Consul Resolver"
  type        = bool
  default     = false
}

variable "consul_resolver_name" {
  description = "Name of Consul Resolver"
  type        = string
  default     = "consul-dc1"
}

variable "consul_resolver_spec" {
  description = "Specification of Consul Resolver"
  type = object({
    address    = string,
    datacenter = string,
  })
  default = null
}

variable "create_default_listeners" {
  description = "Whether Emissary should be created with default listeners: HTTP on port 8080, HTTPS on port 8443. See https://www.getambassador.io/docs/emissary/latest/howtos/configure-communications/"
  type        = bool
  default     = false
}
