# Ambassador Consul Connector

This module deploys the Consul Connector so that Ambassador can integrate with Consul Connect
Service Mesh.

See the documentation for [Consul Connect](https://www.consul.io/docs/connect) for more
information, and on how Ambassador
[integrates])(https://www.getambassador.io/docs/latest/howtos/consul/) with Consul Connect.

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
| affinity | Affinity for pod | `map` | `{}` | no |
| ambassador\_id | Ambassador ID, if any | `string` | `""` | no |
| autoscaling\_enabled | Enable Horizontal Pod Autoscaler | `bool` | `false` | no |
| chart\_name | Helm chart name to provision | `string` | `"ambassador-consul-connector"` | no |
| chart\_namespace | Namespace to install the chart into | `string` | `"default"` | no |
| chart\_repository | Helm repository for the chart | `string` | `"https://basisai.github.io/charts/"` | no |
| chart\_timeout | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| chart\_version | Version of Chart to install. Set to empty to install the latest version | `string` | `"0.1.0"` | no |
| env | Environment variables for the container | `list` | `[]` | no |
| image\_repository | Image repository | `string` | `"quay.io/datawire/aes"` | no |
| image\_tag | Image tag. Defaults to the chart appVersion if unspecified. | `string` | `""` | no |
| max\_history | Max History for Helm | `number` | `20` | no |
| max\_replicas | Maximum replicas for Horizontal Pod Autoscaler | `number` | `5` | no |
| min\_replicas | Minimum replicas for Horizontal Pod Autoscaler | `number` | `1` | no |
| pod\_security\_context | Pod security context | `map` | `{}` | no |
| release\_name | Helm release name | `string` | `"ambassador-consul-connector"` | no |
| replicas | Number of replicas | `number` | `1` | no |
| resources | Resources for the pod | `map` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "200Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "200Mi"<br>  }<br>}</pre> | no |
| security\_context | Security context for the container | `map` | `{}` | no |
| target\_cpu\_utilization\_percentage | Target CPU Utility in percent for Horizontal Pod Autoscaler | `number` | `80` | no |
| target\_memory\_utilization\_percentage | Target Memory Utility in percent for Horizontal Pod Autoscaler | `number` | `80` | no |
| tolerations | Pod tolerations | `list` | `[]` | no |
| volume\_mounts | Volume Mounts for the container | `list` | `[]` | no |
| volumes | Additional volumes for the pod | `list` | `[]` | no |

## Outputs

No output.
