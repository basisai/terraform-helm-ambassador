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
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.authservices.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=authservices.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.consulresolvers.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=consulresolvers.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.devportals.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=devportals.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.filterpolicies.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=filterpolicies.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.filters.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=filters.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.hosts.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=hosts.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.kubernetesendpointresolvers.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=kubernetesendpointresolvers.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.kubernetesserviceresolvers.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=kubernetesserviceresolvers.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.logservices.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=logservices.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.mappings.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=mappings.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.modules.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=modules.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.projectcontrollers.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=projectcontrollers.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.projectrevisions.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=projectrevisions.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.projects.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=projects.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.ratelimits.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=ratelimits.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.ratelimitservices.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=ratelimitservices.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.tcpmappings.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=tcpmappings.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.tlscontexts.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=tlscontexts.getambassador.io"
terraform import 'module.crd.kubernetes_manifest.crds["apiextensions.k8s.io/v1.CustomResourceDefinition.default.tracingservices.getambassador.io"]' "apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,namespace=default,name=tracingservices.getambassador.io"
```

Note that the 1.x Helm charts created CRDs that are only used in AES and these will be imported and
destroyed on an apply because these CRDs are not created with the YAML manifest file for Emissary
Ingress.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.crds](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [http_http.manifest](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_manifest_version"></a> [manifest\_version](#input\_manifest\_version) | Version of the CRDs to install | `string` | `"2.1.0"` | no |
| <a name="input_yaml_manifest"></a> [yaml\_manifest](#input\_yaml\_manifest) | Override the YAML manifest instead of the one from the usual URL | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources"></a> [resources](#output\_resources) | List of resources created |
