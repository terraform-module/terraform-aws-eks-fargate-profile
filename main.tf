locals {
  suffix = length(var.suffix) > 0 ? format("-%s", var.suffix) : ""
}

data aws_iam_policy_document assume_role {
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
  for_each           = toset(var.namespaces)
  name               = format("%s-fargate-%s%s", var.cluster_name, each.value, local.suffix)
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = merge(var.tags,
    { Namespace = each.value },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" },
  { "k8s.io/cluster/${var.cluster_name}" = "owned" })
}

resource aws_iam_role_policy_attachment attachment_main {
  for_each   = toset(var.namespaces)
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.this[each.value].name
}

resource aws_eks_fargate_profile this {
  for_each               = toset(var.namespaces)
  cluster_name           = var.cluster_name
  fargate_profile_name   = format("%s-fargate-%s%s", var.cluster_name, each.value, local.suffix)
  pod_execution_role_arn = aws_iam_role.this[each.value].arn
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
