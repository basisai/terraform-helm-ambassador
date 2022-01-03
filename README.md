# Terraform Emissary Ingress via Helm

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_service_annotations"></a> [admin\_service\_annotations](#input\_admin\_service\_annotations) | Annotations for admin service | `map` | `{}` | no |
| <a name="input_admin_service_create"></a> [admin\_service\_create](#input\_admin\_service\_create) | Create admin service | `bool` | `true` | no |
| <a name="input_admin_service_node_port"></a> [admin\_service\_node\_port](#input\_admin\_service\_node\_port) | odePort used if type is NodePort | `number` | `38877` | no |
| <a name="input_admin_service_port"></a> [admin\_service\_port](#input\_admin\_service\_port) | Port for admin service | `number` | `8877` | no |
| <a name="input_admin_service_type"></a> [admin\_service\_type](#input\_admin\_service\_type) | Service type for admin service | `string` | `"ClusterIP"` | no |
| <a name="input_admin_snapshot_port"></a> [admin\_snapshot\_port](#input\_admin\_snapshot\_port) | Port for admin snapshot | `number` | `8005` | no |
| <a name="input_affinity"></a> [affinity](#input\_affinity) | Pod affinity | `map` | `{}` | no |
| <a name="input_ambassador_config"></a> [ambassador\_config](#input\_ambassador\_config) | Ambassador Config | `string` | `""` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"emissary-ingress"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"ambassador"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://app.getambassador.io"` | no |
| <a name="input_chart_timeout"></a> [chart\_timeout](#input\_chart\_timeout) | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"7.2.0"` | no |
| <a name="input_consul_resolver_create"></a> [consul\_resolver\_create](#input\_consul\_resolver\_create) | Create Consul Resolver | `bool` | `false` | no |
| <a name="input_consul_resolver_name"></a> [consul\_resolver\_name](#input\_consul\_resolver\_name) | Name of Consul Resolver | `string` | `"consul-dc1"` | no |
| <a name="input_consul_resolver_spec"></a> [consul\_resolver\_spec](#input\_consul\_resolver\_spec) | Specification of Consul Resolver | <pre>object({<br>    address    = string,<br>    datacenter = string,<br>  })</pre> | `null` | no |
| <a name="input_container_security_context"></a> [container\_security\_context](#input\_container\_security\_context) | Container security context | `map` | <pre>{<br>  "allowPrivilegeEscalation": false<br>}</pre> | no |
| <a name="input_daemonset"></a> [daemonset](#input\_daemonset) | Deploy as a DaemonSet | `bool` | `false` | no |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Deploymoent annotations | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Labels for deployments | `map` | `{}` | no |
| <a name="input_endpoint_resolver_create"></a> [endpoint\_resolver\_create](#input\_endpoint\_resolver\_create) | Create endpoint resolver. See https://www.getambassador.io/docs/latest/topics/running/resolvers/ | `bool` | `false` | no |
| <a name="input_endpoint_resolver_name"></a> [endpoint\_resolver\_name](#input\_endpoint\_resolver\_name) | Name of endpoint resolver | `string` | `"endpoint"` | no |
| <a name="input_env"></a> [env](#input\_env) | Additional environment variables | `map` | `{}` | no |
| <a name="input_env_raw"></a> [env\_raw](#input\_env\_raw) | 'Raw' container environment variables | `list` | `[]` | no |
| <a name="input_external_ips"></a> [external\_ips](#input\_external\_ips) | External IPs for the service | `list` | `[]` | no |
| <a name="input_external_traffic_policy"></a> [external\_traffic\_policy](#input\_external\_traffic\_policy) | Load balancer external traffic policy | `string` | `"Local"` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | Use host networking | `bool` | `false` | no |
| <a name="input_hpa_enabled"></a> [hpa\_enabled](#input\_hpa\_enabled) | Enable HorizontalPodAutoscaler | `bool` | `false` | no |
| <a name="input_hpa_max_replicas"></a> [hpa\_max\_replicas](#input\_hpa\_max\_replicas) | Min number of replicas for HPA scaling | `number` | `5` | no |
| <a name="input_hpa_metrics"></a> [hpa\_metrics](#input\_hpa\_metrics) | Metrics for HPA Scaling | `list` | <pre>[<br>  {<br>    "resource": {<br>      "name": "cpu",<br>      "target": {<br>        "averageUtilization": 60,<br>        "type": "Utilization"<br>      }<br>    },<br>    "type": "Resource"<br>  },<br>  {<br>    "resource": {<br>      "name": "memory",<br>      "target": {<br>        "averageUtilization": 60,<br>        "type": "Utilization"<br>      }<br>    },<br>    "type": "Resource"<br>  }<br>]</pre> | no |
| <a name="input_hpa_min_replicas"></a> [hpa\_min\_replicas](#input\_hpa\_min\_replicas) | Min number of replicas for HPA scaling | `number` | `2` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Docker image repository | `string` | `"gcr.io/datawire/emissary"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Docker image tag | `string` | `"2.1.0"` | no |
| <a name="input_init_containers"></a> [init\_containers](#input\_init\_containers) | Custom init containers | `list` | `[]` | no |
| <a name="input_liveness_probe"></a> [liveness\_probe](#input\_liveness\_probe) | Liveness Probe configuration | `map` | <pre>{<br>  "failureThreshold": 3,<br>  "initialDelaySeconds": 30,<br>  "periodSeconds": 3<br>}</pre> | no |
| <a name="input_load_balancer_ip"></a> [load\_balancer\_ip](#input\_load\_balancer\_ip) | LoadBalancer IP, if supported by the cloud provider | `string` | `""` | no |
| <a name="input_load_balancer_source_ranges"></a> [load\_balancer\_source\_ranges](#input\_load\_balancer\_source\_ranges) | List of CIDRs that the load balancer will accept traffic from | `list` | `[]` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | Override name of generated service | `string` | `null` | no |
| <a name="input_namespace_env"></a> [namespace\_env](#input\_namespace\_env) | Set the AMBASSADOR\_NAMESPACE environment variable | `any` | `null` | no |
| <a name="input_pod_annotations"></a> [pod\_annotations](#input\_pod\_annotations) | Pod annotations | `map` | `{}` | no |
| <a name="input_pod_disruption_budget"></a> [pod\_disruption\_budget](#input\_pod\_disruption\_budget) | Pod Disruption budget | `map` | `{}` | no |
| <a name="input_pod_labels"></a> [pod\_labels](#input\_pod\_labels) | Labels for pods | `map` | `{}` | no |
| <a name="input_pod_security_context"></a> [pod\_security\_context](#input\_pod\_security\_context) | Pod Security Context | `map` | <pre>{<br>  "runAsUser": 8888<br>}</pre> | no |
| <a name="input_ports"></a> [ports](#input\_ports) | Service Ports | `list` | <pre>[<br>  {<br>    "name": "http",<br>    "port": 80,<br>    "targetPort": 8080<br>  },<br>  {<br>    "name": "https",<br>    "port": 443,<br>    "targetPort": 8443<br>  }<br>]</pre> | no |
| <a name="input_priority_class_name"></a> [priority\_class\_name](#input\_priority\_class\_name) | Priority class names | `string` | `""` | no |
| <a name="input_rbac_create"></a> [rbac\_create](#input\_rbac\_create) | Create RBAC resources | `bool` | `true` | no |
| <a name="input_rbac_name_override"></a> [rbac\_name\_override](#input\_rbac\_name\_override) | Name of the RBAC resources defaults to the name of the release. Set nameOverride when installing Ambassador with cluster-wide scope in different namespaces with the same release name to avoid conflicts. | `string` | `""` | no |
| <a name="input_rbac_psp"></a> [rbac\_psp](#input\_rbac\_psp) | List of PSP to enable usage of | `list` | `[]` | no |
| <a name="input_readiness_probe"></a> [readiness\_probe](#input\_readiness\_probe) | Readiness probe configuration | `map` | <pre>{<br>  "failureThreshold": 3,<br>  "initialDelaySeconds": 30,<br>  "periodSeconds": 3<br>}</pre> | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"ambassador"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas | `number` | `3` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Pod resources | `map` | <pre>{<br>  "limits": {<br>    "cpu": "1000m",<br>    "memory": "600Mi"<br>  },<br>  "requests": {<br>    "cpu": "200m",<br>    "memory": "600Mi"<br>  }<br>}</pre> | no |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | Restart policy for pods | `string` | `""` | no |
| <a name="input_service_account_create"></a> [service\_account\_create](#input\_service\_account\_create) | Create service account | `bool` | `true` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Override service account name | `string` | `""` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Annotation for the service | `map` | `{}` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Service Type | `string` | `"LoadBalancer"` | no |
| <a name="input_session_affinity"></a> [session\_affinity](#input\_session\_affinity) | Session affinity, if any | `string` | `"None"` | no |
| <a name="input_session_affinity_config"></a> [session\_affinity\_config](#input\_session\_affinity\_config) | Session affinity config | `map` | `{}` | no |
| <a name="input_sidecar_containers"></a> [sidecar\_containers](#input\_sidecar\_containers) | Custom Sidecar containers | `list` | `[]` | no |
| <a name="input_single_namespace"></a> [single\_namespace](#input\_single\_namespace) | tells Ambassador to only use resources in the namespace or namespace set by namespace.name | `bool` | `false` | no |
| <a name="input_termination_grace_period_seconds"></a> [termination\_grace\_period\_seconds](#input\_termination\_grace\_period\_seconds) | Termination grace period | `string` | `""` | no |
| <a name="input_test_enabled"></a> [test\_enabled](#input\_test\_enabled) | Deploy a test pod to test deployment | `bool` | `true` | no |
| <a name="input_test_image"></a> [test\_image](#input\_test\_image) | Image used for test pod | `string` | `"busybox"` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Pod tolerations | `list` | `[]` | no |
| <a name="input_topology_spread_constraints"></a> [topology\_spread\_constraints](#input\_topology\_spread\_constraints) | Topology Spread Constraints for pods | `list` | `[]` | no |
| <a name="input_volume_mounts"></a> [volume\_mounts](#input\_volume\_mounts) | Additional volume mounts | `list` | `[]` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Additional volumes | `list` | `[]` | no |

## Outputs

No outputs.
