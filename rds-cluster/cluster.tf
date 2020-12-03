module "db" {
source = "john24rel/rds-cluster/aws"
region = "us-east-2"
subnet_ids = [
		"subnet-0ef4a790d04655f17", 
		"subnet-042f3148fa63ea57e", 
		"subnet-0c1faf9f9e20d6aaa",
    ]
security_group_name = "db"
allowed_hosts = [
"0.0.0.0/0"
]
db_name = "dbname"
engine = "aurora"
engine_version = "5.6.10a"
instance_class = "db.t2.micro"
username = "foo"
password = "foobarbaz"
publicly_accessible = true
}



output "region" {
value = "${module.db.region}"
}
output "subnet_list" {
value = "${module.db.subnet_list}"
}
output "allows_hosts" {
value = "${module.db.allowed_hosts}"
}
output "DB_NAME" {
value = "${module.db.DB_NAME}"
}

