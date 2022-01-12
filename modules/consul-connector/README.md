# Ambassador Consul Connector

This module deploys the Consul Connector so that Ambassador can integrate with Consul Connect
Service Mesh.

See the documentation for [Consul Connect](https://www.consul.io/docs/connect) for more
information, and on how Ambassador
[integrates])(https://www.getambassador.io/docs/latest/howtos/consul/) with Consul Connect.

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
| <a name="input_affinity"></a> [affinity](#input\_affinity) | Affinity for pod | `map` | `{}` | no |
| <a name="input_ambassador_id"></a> [ambassador\_id](#input\_ambassador\_id) | Ambassador ID, if any | `string` | `""` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Enable Horizontal Pod Autoscaler | `bool` | `false` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"ambassador-consul-connector"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"default"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://basisai.github.io/charts/"` | no |
| <a name="input_chart_timeout"></a> [chart\_timeout](#input\_chart\_timeout) | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"0.1.0"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment variables for the container | `list` | `[]` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository | `string` | `"quay.io/datawire/aes"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Image tag. Defaults to the chart appVersion if unspecified. | `string` | `""` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_max_replicas"></a> [max\_replicas](#input\_max\_replicas) | Maximum replicas for Horizontal Pod Autoscaler | `number` | `5` | no |
| <a name="input_min_replicas"></a> [min\_replicas](#input\_min\_replicas) | Minimum replicas for Horizontal Pod Autoscaler | `number` | `1` | no |
| <a name="input_pod_security_context"></a> [pod\_security\_context](#input\_pod\_security\_context) | Pod security context | `map` | `{}` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"ambassador-consul-connector"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas | `number` | `1` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Resources for the pod | `map` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "200Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "200Mi"<br>  }<br>}</pre> | no |
| <a name="input_security_context"></a> [security\_context](#input\_security\_context) | Security context for the container | `map` | `{}` | no |
| <a name="input_target_cpu_utilization_percentage"></a> [target\_cpu\_utilization\_percentage](#input\_target\_cpu\_utilization\_percentage) | Target CPU Utility in percent for Horizontal Pod Autoscaler | `number` | `80` | no |
| <a name="input_target_memory_utilization_percentage"></a> [target\_memory\_utilization\_percentage](#input\_target\_memory\_utilization\_percentage) | Target Memory Utility in percent for Horizontal Pod Autoscaler | `number` | `80` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Pod tolerations | `list` | `[]` | no |
| <a name="input_volume_mounts"></a> [volume\_mounts](#input\_volume\_mounts) | Volume Mounts for the container | `list` | `[]` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Additional volumes for the pod | `list` | `[]` | no |

## Outputs

No outputs.
