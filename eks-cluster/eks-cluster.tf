data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token = data.aws_eks_cluster_auth.cluster.token
  load_config_file = false
  version = "~> 1.9"
}

module "my-cluster" {
  source = "john24rel/esk-cluster/aws"
  version = "12.0.0"
  cluster_name          = "my-cluster"
  cluster_version       = "1.14"
  subnets               = [
		"subnet-0ef4a790d04655f17", 
		"subnet-042f3148fa63ea57e", 
		"subnet-0c1faf9f9e20d6aaa",
    ]
  vpc_id               = "vpc-0a6f0eb80882caea8"
  instance_type        = "m4.large"
  asg_max_size         = 5
  asg_min_size         = 1
  region               = "us-east-2"
