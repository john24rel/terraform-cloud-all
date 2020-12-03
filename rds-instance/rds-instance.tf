module "db" {
	source = "john24rel/instance/rds"
	region = "us-east-2"
	subnet_ids = [
		"subnet-09e046e79485b9194", 
		"subnet-0d27bd3f9c6a10988", 
		"subnet-0533f931432ff4966",
	]
	security_group_name = "db"
	allowed_hosts = [
		"0.0.0.0/0"
	]
	db_name = "dbname"
	engine = "mysql"
	engine_version = "5.7"
	instance_class = "db.t2.micro"
	username = "foo"
	password = "foobarbaz"
	publicly_accessible = true
    allocated_storage = "20"
}

output "region" {
	value = "${module.db.region}"
}
output "subnet_list" {
	value = "${module.db.subnet_list}"
}
output "allowed_hosts" {
	value = "${module.db.allowed_hosts}"
}
output "DB_NAME" {
	value = "${module.db.DB_NAME}"
}
