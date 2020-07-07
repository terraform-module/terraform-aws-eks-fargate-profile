# terraform-aws-eks-fargate-profile

Terraform module to provision an EKS Fargate Profiles for [Elastic Container Service for Kubernetes](https://aws.amazon.com/eks/).

Based on [Terraform Resource](https://www.terraform.io/docs/providers/aws/r/eks_fargate_profile.html)

## Usage example

Here's the gist of using it directly from github.

```hcl
    module "eks_fargate" {
      source  = "terraform-module/eks-fargate-profile/aws"
      version = "2.1.0"

      tags                 = var.tags
      subnet_ids           = var.subnet_ids
      cluster_name         = var.cluster_name
      namespaces            = var.namespaces
      labels               = var.labels
    }
```

## Assumptions

## Available features

## Module Variables

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.2 |
| aws | >= 2.5 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.5 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Cluster name | `string` | n/a | yes |
| labels | Key-value mapping of Kubernetes labels for selection | `map(string)` | `{}` | no |
| namespaces | Kubernetes namespaces for selection (set to an empty string to disable resource creation) | `list(string)` | n/a | yes |
| subnet\_ids | Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER\_NAME (where CLUSTER\_NAME is replaced with the name of the EKS Cluster) | `list(string)` | n/a | yes |
| suffix | Suffix added to the name. In case we need more then one profile in same namespace | `string` | `""` | no |
| tags | Additional tags (e.g. `{ Deployed = "xxxx" }` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| eks\_fargate\_profile\_arn | Amazon Resource Name (ARN) of the EKS Fargate Profile |
| eks\_fargate\_profile\_id | EKS Cluster name and EKS Fargate Profile name separated by a colon |
| eks\_fargate\_profile\_role\_arn | ARN of the EKS Fargate Profile IAM role |
| eks\_fargate\_profile\_role\_name | Name of the EKS Fargate Profile IAM role |
| eks\_fargate\_profile\_status | Status of the EKS Fargate Profile |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Commands

<!-- START makefile-doc -->
```
$ make help
hooks                          Commit hooks setup
validate                       Validate with pre-commit hooks
changelog                      Update changelog
release                        Create release version
```
<!-- END makefile-doc -->


## License

Copyright 2019 ivankatliarhcuk

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## How to Contribute

Submit a pull request

# Authors

Currently maintained by [Ivan Katliarchuk](https://github.com/ivankatliarchuk) and these [awesome contributors](https://github.com/terraform-module/terraform-module-blueprint/graphs/contributors).

## Terraform Registry

- [Module](https://registry.terraform.io/modules/terraform-module/eks-fargate-profile/aws)
