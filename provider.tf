provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.44"
}


data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = var.cluster_name
}

locals {
  cluster = {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster_auth.token
    load_config_file       = false
    version                = "~> 1.9"

  }
}


provider "kubernetes" {
  host                   = local.cluster.host
  cluster_ca_certificate = local.cluster.cluster_ca_certificate
  token                  = local.cluster.token
  load_config_file       = local.cluster.load_config_file
  version                = "~> 1.9"
  alias                  = "eks"
}
