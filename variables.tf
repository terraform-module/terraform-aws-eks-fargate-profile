variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "subnet_ids" {
  description = "Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ Deployed = \"xxxx\" }`"
}

variable "namespaces" {
  type        = list(string)
  description = "Kubernetes namespace(s) for selection.  Adding more than one namespace, creates and manages multiple namespaces."
}

variable "labels" {
  type        = map(string)
  description = "Key-value mapping of Kubernetes labels for selection"
  default     = {}
}

variable "prefix" {
  type        = string
  description = "Prefix added to the name. In case your cluster name begins with a reserved string (e.g. `eks-`)."
  default     = ""
}

variable "suffix" {
  type        = string
  description = "Suffix added to the name. In case we need more then one profile in same namespace"
  default     = ""
}
