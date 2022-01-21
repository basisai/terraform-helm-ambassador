# Emissary Ingress CRD Installer

This module is a (beta) attempt to install the CRDs that used to be installed by Helm in v1 of
Emissary Ingress. It's now a separate YAML manifest file that you have to install via
`kubectl apply -f`.

See [the documentation](https://www.getambassador.io/docs/emissary/latest/topics/install/helm/)
for more information.

## Migrating from Emissary Ingress 1.x

You can use the following example commands to import existing CRDs created by the 1.x version of the
Helm chart into your Terraform State.

Modify the path of your resources accordingly:

```bash
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/authservices.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//authservices.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/consulresolvers.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//consulresolvers.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/devportals.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//devportals.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/filterpolicies.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//filterpolicies.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/filters.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//filters.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/hosts.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//hosts.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/kubernetesendpointresolvers.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//kubernetesendpointresolvers.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/kubernetesserviceresolvers.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//kubernetesserviceresolvers.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/logservices.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//logservices.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/mappings.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//mappings.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/modules.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//modules.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/projectcontrollers.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//projectcontrollers.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/projectrevisions.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//projectrevisions.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/projects.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//projects.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/ratelimits.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//ratelimits.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/ratelimitservices.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//ratelimitservices.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/tcpmappings.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//tcpmappings.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/tlscontexts.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//tlscontexts.getambassador.io"
terraform import 'module.crd.kubectl_manifest.manifest["/apis/apiextensions.k8s.io/v1/customresourcedefinitions/tracingservices.getambassador.io"]' "apiextensions.k8s.io/v1//CustomResourceDefinition//tracingservices.getambassador.io"
```

Note that the 1.x Helm charts created CRDs that are only used in AES and these will be imported and
destroyed on an apply because these CRDs are not created with the YAML manifest file for Emissary
Ingress.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | 2.1.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.13 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.manifest](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [http_http.manifest](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [kubectl_file_documents.manifest](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_manifest_version"></a> [manifest\_version](#input\_manifest\_version) | Version of the CRDs to install | `string` | `"2.1.0"` | no |
| <a name="input_yaml_manifest"></a> [yaml\_manifest](#input\_yaml\_manifest) | Override the YAML manifest instead of the one from the usual URL | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources"></a> [resources](#output\_resources) | List of resources created |
