locals {
  suffix = length(var.suffix) > 0 ? format("-%s", var.suffix) : ""
}

data aws_iam_policy_document assume_role {
  #count = var.enabled ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks-fargate-pods.amazonaws.com"]
    }
  }
}

resource aws_iam_role this {
  #count              = var.enabled ? 1 : 0
  for_each           = toset(var.namespaces)
  name               = format("%s-fargate-%s%s", var.cluster_name, each.value, local.suffix)
  assume_role_policy = join("", data.aws_iam_policy_document.assume_role.*.json)
  tags = merge(var.tags,
    { Namespace = each.value },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" },
  { "k8s.io/cluster/${var.cluster_name}" = "owned" })
}

resource aws_iam_role_policy_attachment attachment_main {
  #count      = var.enabled ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = join("", aws_iam_role.this.*.name)
}

resource aws_eks_fargate_profile this {
  #count                  = var.enabled ? 1 : 0
  for_each               = toset(var.namespaces)
  cluster_name           = var.cluster_name
  fargate_profile_name   = format("%s-fargate-%s%s", var.cluster_name, each.value, local.suffix)
  pod_execution_role_arn = join("", aws_iam_role.this.*.arn)
  subnet_ids             = var.subnet_ids

  tags = merge(var.tags,
    { Namespace = each.value },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" },
  { "k8s.io/cluster/${var.cluster_name}" = "owned" })

  selector {
    namespace = each.value
    labels    = var.labels
  }
}
