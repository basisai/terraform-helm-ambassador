variable "release_name" {
  description = "Helm release name"
  default     = "ambassador"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "ambassador"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://getambassador.io"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "6.5.13"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "default"
}

variable "chart_timeout" {
  description = "Timeout to wait for the Chart to be deployed."
  default     = 300
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

#######################
# Chart Values
#######################
variable "replicas" {
  description = "Number of replicas"
  default     = 3
}

variable "daemonset" {
  description = "Deploy as a DaemonSet"
  default     = false
}

variable "image_repository" {
  description = "Docker image repository"
  default     = "quay.io/datawire/aes"
}

variable "image_tag" {
  description = "Docker image tag"
  default     = "1.9.1"
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
  description = "HorizontalPodAutoscaler H"
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
  description = "'Raw' container environment variables"
  default     = []
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
  defaut      = 8877
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
  default = ""
}
