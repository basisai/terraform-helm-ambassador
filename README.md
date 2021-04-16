# Terraform Ambassador via Helm

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| helm | >= 1 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_service\_annotations | Annotations for admin service | `map` | `{}` | no |
| admin\_service\_create | Create admin service | `bool` | `true` | no |
| admin\_service\_node\_port | odePort used if type is NodePort | `number` | `38877` | no |
| admin\_service\_port | Port for admin service | `number` | `8877` | no |
| admin\_service\_type | Service type for admin service | `string` | `"ClusterIP"` | no |
| admin\_snapshot\_port | Port for admin snapshot | `number` | `8005` | no |
| affinity | Pod affinity | `map` | `{}` | no |
| ambassador\_config | Ambassador Config | `string` | `""` | no |
| auth\_service\_config | Configuration for AuthService | `map` | `{}` | no |
| auth\_service\_create | Deploy AuthService | `bool` | `true` | no |
| chart\_name | Helm chart name to provision | `string` | `"ambassador"` | no |
| chart\_namespace | Namespace to install the chart into | `string` | `"default"` | no |
| chart\_repository | Helm repository for the chart | `string` | `"https://getambassador.io"` | no |
| chart\_timeout | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| chart\_version | Version of Chart to install. Set to empty to install the latest version | `string` | `"6.6.3"` | no |
| consul\_resolver\_create | Create Consul Resolver | `bool` | `false` | no |
| consul\_resolver\_name | Name of Consul Resolver | `string` | `"consul-dc1"` | no |
| consul\_resolver\_spec | Specification of Consul Resolver | <pre>object({<br>    address    = string,<br>    datacenter = string,<br>  })</pre> | `null` | no |
| container\_security\_context | Container security context | `map` | <pre>{<br>  "allowPrivilegeEscalation": false<br>}</pre> | no |
| crds\_create | Create CRDs | `bool` | `true` | no |
| crds\_enable | Enable CRDs | `bool` | `true` | no |
| crds\_keep | Keep CRDs | `bool` | `true` | no |
| create\_dev\_portal\_mappings | # The DevPortal is exposed at /docs/ endpoint in the AES container. Setting this to true will automatically create routes for the DevPortal. | `bool` | `true` | no |
| daemonset | Deploy as a DaemonSet | `bool` | `false` | no |
| deployment\_annotations | Deploymoent annotations | `map` | `{}` | no |
| deployment\_labels | Labels for deployments | `map` | `{}` | no |
| enable\_aes | Enable Edge Stack | `bool` | `true` | no |
| endpoint\_resolver\_create | Create endpoint resolver. See https://www.getambassador.io/docs/latest/topics/running/resolvers/ | `bool` | `false` | no |
| endpoint\_resolver\_name | Name of endpoint resolver | `string` | `"endpoint"` | no |
| env | Additional environment variables | `map` | `{}` | no |
| env\_raw | 'Raw' container environment variables | `list` | `[]` | no |
| external\_ips | External IPs for the service | `list` | `[]` | no |
| external\_traffic\_policy | Load balancer external traffic policy | `string` | `"Local"` | no |
| host\_network | Use host networking | `bool` | `false` | no |
| hpa\_enabled | Enable HorizontalPodAutoscaler | `bool` | `false` | no |
| hpa\_max\_replicas | Min number of replicas for HPA scaling | `number` | `5` | no |
| hpa\_metrics | Metrics for HPA Scaling | `list` | <pre>[<br>  {<br>    "resource": {<br>      "name": "cpu",<br>      "target": {<br>        "averageUtilization": 60,<br>        "type": "Utilization"<br>      }<br>    },<br>    "type": "Resource"<br>  },<br>  {<br>    "resource": {<br>      "name": "memory",<br>      "target": {<br>        "averageUtilization": 60,<br>        "type": "Utilization"<br>      }<br>    },<br>    "type": "Resource"<br>  }<br>]</pre> | no |
| hpa\_min\_replicas | Min number of replicas for HPA scaling | `number` | `2` | no |
| image\_repository | Docker image repository | `string` | `"quay.io/datawire/aes"` | no |
| image\_tag | Docker image tag | `string` | `"1.12.3"` | no |
| init\_containers | Custom init containers | `list` | `[]` | no |
| license\_key | License key for AES | `string` | `""` | no |
| license\_key\_create\_secret | Create secret for license key | `bool` | `true` | no |
| license\_key\_secret\_annotations | License key secret annotations | `map` | `{}` | no |
| license\_key\_secret\_name | Secret name for license | `string` | `""` | no |
| liveness\_probe | Liveness Probe configuration | `map` | <pre>{<br>  "failureThreshold": 3,<br>  "initialDelaySeconds": 30,<br>  "periodSeconds": 3<br>}</pre> | no |
| load\_balancer\_ip | LoadBalancer IP, if supported by the cloud provider | `string` | `""` | no |
| load\_balancer\_source\_ranges | List of CIDRs that the load balancer will accept traffic from | `list` | `[]` | no |
| max\_history | Max History for Helm | `number` | `20` | no |
| name\_override | Override name of generated service | `string` | `null` | no |
| namespace\_env | Set the AMBASSADOR\_NAMESPACE environment variable | `any` | `null` | no |
| pod\_annotations | Pod annotations | `map` | `{}` | no |
| pod\_disruption\_budget | Pod Disruption budget | `map` | `{}` | no |
| pod\_labels | Labels for pods | `map` | `{}` | no |
| pod\_security\_context | Pod Security Context | `map` | <pre>{<br>  "runAsUser": 8888<br>}</pre> | no |
| ports | Service Ports | `list` | <pre>[<br>  {<br>    "name": "http",<br>    "port": 80,<br>    "targetPort": 8080<br>  },<br>  {<br>    "name": "https",<br>    "port": 443,<br>    "targetPort": 8443<br>  }<br>]</pre> | no |
| priority\_class\_name | Priority class names | `string` | `""` | no |
| rate\_limit\_create | Create the RateLimitService | `bool` | `true` | no |
| rbac\_create | Create RBAC resources | `bool` | `true` | no |
| rbac\_name\_override | Name of the RBAC resources defaults to the name of the release. Set nameOverride when installing Ambassador with cluster-wide scope in different namespaces with the same release name to avoid conflicts. | `string` | `""` | no |
| rbac\_psp | List of PSP to enable usage of | `list` | `[]` | no |
| readiness\_probe | Readiness probe configuration | `map` | <pre>{<br>  "failureThreshold": 3,<br>  "initialDelaySeconds": 30,<br>  "periodSeconds": 3<br>}</pre> | no |
| redis\_affinity | Affinity for redis pods | `map` | `{}` | no |
| redis\_create | Create Redis | `bool` | `true` | no |
| redis\_deployment\_annotations | Redis deployment annotations | `map` | `{}` | no |
| redis\_image | Redis image | `string` | `"redis"` | no |
| redis\_resources | Redis resources | `map` | `{}` | no |
| redis\_service\_annotations | Redis service annotations | `map` | `{}` | no |
| redis\_tag | Redis image tag | `string` | `"5.0.1"` | no |
| redis\_tolerations | Redis tolerations | `list` | `[]` | no |
| redis\_url | Custom Redis URL | `string` | `""` | no |
| registry\_create | Enable Projects beta feature | `bool` | `false` | no |
| release\_name | Helm release name | `string` | `"ambassador"` | no |
| replicas | Number of replicas | `number` | `3` | no |
| resources | Pod resources | `map` | <pre>{<br>  "limits": {<br>    "cpu": "1000m",<br>    "memory": "600Mi"<br>  },<br>  "requests": {<br>    "cpu": "200m",<br>    "memory": "600Mi"<br>  }<br>}</pre> | no |
| restart\_policy | Restart policy for pods | `string` | `""` | no |
| service\_account\_create | Create service account | `bool` | `true` | no |
| service\_account\_name | Override service account name | `string` | `""` | no |
| service\_annotations | Annotation for the service | `map` | `{}` | no |
| service\_type | Service Type | `string` | `"LoadBalancer"` | no |
| session\_affinity | Session affinity, if any | `string` | `"None"` | no |
| session\_affinity\_config | Session affinity config | `map` | `{}` | no |
| sidecar\_containers | Custom Sidecar containers | `list` | `[]` | no |
| single\_namespace | tells Ambassador to only use resources in the namespace or namespace set by namespace.name | `bool` | `false` | no |
| termination\_grace\_period\_seconds | Termination grace period | `string` | `""` | no |
| test\_enabled | Deploy a test pod to test deployment | `bool` | `true` | no |
| test\_image | Image used for test pod | `string` | `"busybox"` | no |
| tolerations | Pod tolerations | `list` | `[]` | no |
| topology\_spread\_constraints | Topology Spread Constraints for pods | `list` | `[]` | no |
| volume\_mounts | Additional volume mounts | `list` | `[]` | no |
| volumes | Additional volumes | `list` | `[]` | no |

## Outputs

No output.
