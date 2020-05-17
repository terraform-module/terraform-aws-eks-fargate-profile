module "eks_fargate" {
  source  = "terraform-module/eks-fargate-profile/aws"
  version = "2.1.0"

  tags                 = var.tags
  subnet_ids           = ["sb-xdfasetrqwet"]
  cluster_name         = "cluster-name"
  kubernetes_namespace = "default"
  kubernetes_labels = {
    "app.kubernetes.io/name" = "app"
  }
}
