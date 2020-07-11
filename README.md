# terraform-aws-eks-fargate-profile

Terraform module to provision an EKS Fargate Profiles for [Elastic Container Service for Kubernetes](https://aws.amazon.com/eks/).

Based on [Terraform Resource](https://www.terraform.io/docs/providers/aws/r/eks_fargate_profile.html)

[![](https://img.shields.io/github/license/terraform-module/terraform-eks-fargate-profile)](https://github.com/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/v/tag/terraform-module/terraform-aws-eks-fargate-profile)
[![](https://img.shields.io/github/workflow/status/terraform-module/terraform-aws-eks-fargate-profile/commit-check/master)](https://github.com/terraform-module/terraform-aws-eks-fargate-profile/actions?query=is%3Acompleted)
![](https://github.com/terraform-module/terraform-aws-eks-fargate-profile/workflows/commit-check/badge.svg)
![](https://github.com/terraform-module/terraform-aws-eks-fargate-profile/workflows/Labeler/badge.svg)
![](https://img.shields.io/issues/github/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/issues/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/issues-closed/terraform-module/terraform-aws-eks-fargate-profile)
[![](https://img.shields.io/github/languages/code-size/terraform-module/terraform-aws-eks-fargate-profile)](https://github.com/terraform-module/terraform-aws-eks-fargate-profile)
[![](https://img.shields.io/github/repo-size/terraform-module/terraform-aws-eks-fargate-profile)](https://github.com/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/languages/top/terraform-module/terraform-aws-eks-fargate-profile?color=green&logo=terraform&logoColor=blue)
![](https://img.shields.io/github/commit-activity/m/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/contributors/terraform-module/terraform-aws-eks-fargate-profile)
![](https://img.shields.io/github/last-commit/terraform-module/terraform-aws-eks-fargate-profile)
[![Maintenance](https://img.shields.io/badge/Maintenu%3F-oui-green.svg)](https://GitHub.com/terraform-module/terraform-aws-eks-fargate-profile/graphs/commit-activity)
[![GitHub forks](https://img.shields.io/github/forks/terraform-module/terraform-aws-eks-fargate-profile.svg?style=social&label=Fork)](https://github.com/terraform-module/terraform-aws-eks-fargate-profile)


## Usage example

Here's the gist of using it directly from github.

```hcl
    module "eks_fargate" {
      source  = "terraform-module/eks-fargate-profile/aws"
      version = "2.2.0"

      cluster_name         = "my-cluster-name"
      subnet_ids           = ["subnet-xxx"]
      namespaces           = ["default"]
      labels = {
        "app.kubernetes.io/name" = "default-service"
       }
       tags = {
        "ENV" = "dev"
       }

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
| namespaces | Kubernetes namespace(s) for selection.  Adding more than one namespace, creates and manages multiple namespaces. | `list(string)` | n/a | yes |
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
```
<!-- END makefile-doc -->

### :memo: Guidelines

 - :memo: Use a succinct title and description.
 - :bug: Bugs & feature requests can be be opened
 - :signal_strength: Support questions are better asked on [Stack Overflow](https://stackoverflow.com/)
 - :blush: Be nice, civil and polite ([as always](http://contributor-covenant.org/version/1/4/)).

## License

Copyright 2019 ivankatliarhcuk

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## How to Contribute

Submit a pull request

# Authors

Currently maintained by [Ivan Katliarchuk](https://github.com/ivankatliarchuk) and these [awesome contributors](https://github.com/terraform-module/eks-fargate-profile/graphs/contributors).

## Terraform Registry

- [Module](https://registry.terraform.io/modules/terraform-module/eks-fargate-profile/aws)
