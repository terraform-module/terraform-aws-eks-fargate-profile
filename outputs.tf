
output "eks_fargate_profile_role_arn" {
  description = "ARN of the EKS Fargate Profile IAM role"
  value       = [for entry in aws_iam_role.this : entry.arn]
}

output "eks_fargate_profile_role_name" {
  description = "Name of the EKS Fargate Profile IAM role"
  value       = [for entry in aws_iam_role.this : entry.name]
}

output "eks_fargate_profile_id" {
  description = "EKS Cluster name and EKS Fargate Profile name separated by a colon"
  value       = [for entry in aws_eks_fargate_profile.this : entry.id]
}

output "eks_fargate_profile_arn" {
  description = "Amazon Resource Name (ARN) of the EKS Fargate Profile"
  value       = [for entry in aws_eks_fargate_profile.this : entry.arn]
}

output "eks_fargate_profile_status" {
  description = "Status of the EKS Fargate Profile"
  value       = [for entry in aws_eks_fargate_profile.this : entry.status]
}
