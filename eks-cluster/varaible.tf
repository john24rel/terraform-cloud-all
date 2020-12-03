variable "cluster_name" {
    type = string
    }
variable "cluster_version" {
   type = string
    }
variable "subnets" {
    type = list(string)
}
variable "vpc_id" {
    type = string
    }
variable "instance_type" {
    type = string
    }
variable "asg_max_size" {
    type = string
    }
variable "asg_min_size" {
    type = string
    }
