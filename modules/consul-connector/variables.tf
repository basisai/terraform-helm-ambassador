variable "release_name" {
  description = "Helm release name"
  default     = "ambassador-consul-connector"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "ambassador-consul-connector"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://basisai.github.io/charts/"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "0.1.0"
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
  default     = 1
}

variable "image_repository" {
  description = "Image repository"
  default     = "quay.io/datawire/aes"
}

variable "image_tag" {
  description = "Image tag. Defaults to the chart appVersion if unspecified."
  default     = ""
}

variable "ambassador_id" {
  description = "Ambassador ID, if any"
  type        = string
  default     = ""
}

variable "pod_security_context" {
  description = "Pod security context"
  default     = {}
}

variable "security_context" {
  description = "Security context for the container"
  default     = {}
}

variable "env" {
  description = "Environment variables for the container"
  default     = []
}

variable "volumes" {
  description = "Additional volumes for the pod"
  default     = []
}

variable "volume_mounts" {
  description = "Volume Mounts for the container"
  default     = []
}

variable "resources" {
  description = "Resources for the pod"
  default = {
    limits = {
      cpu    = "200m"
      memory = "200Mi"
    }
    requests = {
      cpu    = "100m"
      memory = "200Mi"
    }
  }
}

variable "autoscaling_enabled" {
  description = "Enable Horizontal Pod Autoscaler"
  default     = false
}

variable "min_replicas" {
  description = "Minimum replicas for Horizontal Pod Autoscaler"
  default     = 1
}

variable "max_replicas" {
  description = "Maximum replicas for Horizontal Pod Autoscaler"
  default     = 5
}

variable "target_cpu_utilization_percentage" {
  description = "Target CPU Utility in percent for Horizontal Pod Autoscaler"
  default     = 80
}

variable "target_memory_utilization_percentage" {
  description = "Target Memory Utility in percent for Horizontal Pod Autoscaler"
  default     = 80
}

variable "affinity" {
  description = "Affinity for pod"
  default     = {}
}

variable "tolerations" {
  description = "Pod tolerations"
  default     = []
}
