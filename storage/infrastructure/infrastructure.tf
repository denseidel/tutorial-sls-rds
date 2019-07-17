provider "aws" {
  region = "us-east-1"
}


# default vpc: vpc-229a2545
# https://console.aws.amazon.com/vpc/home?region=us-east-1#vpcs:sort=VpcId
# https://www.terraform.io/docs/providers/aws/r/vpc.html


# default subnets
resource "aws_db_subnet_group" "rds-private-subnet" {
  name       = "rds-private-subnet-group"
  subnet_ids = "${var.rds_subnets}"
}



# https://www.terraform.io/docs/providers/aws/r/rds_cluster.html
resource "aws_rds_cluster" "tenant-management" {
  engine_mode          = "serverless"
  master_password      = "${var.mysql_password}"
  master_username      = "${var.mysql_username}"
  cluster_identifier   = "tenant-management"
  skip_final_snapshot  = true
  db_subnet_group_name = "${aws_db_subnet_group.rds-private-subnet.name}"
  scaling_configuration {
    auto_pause               = true
    max_capacity             = 1
    min_capacity             = 1
    seconds_until_auto_pause = 300
  }
}

# resource "aws_secretsmanager_secret" "tenant-management" {
#   #description         = "${var.secret_description}"
#   #kms_key_id          = "${aws_kms_key.secret.key_id}"
#   name = "test/tenant-management/db"
#   #rotation_lambda_arn = "${aws_lambda_function.rotate-code-mysql.arn}"
#   #rotation_rules {
#   #  automatically_after_days = "${var.rotation_days}"
#   #}
#   #tags                = "${var.tags}"
#   #policy =
# }

# resource "aws_secretsmanager_secret_version" "tenant-management" {
#   lifecycle {
#     ignore_changes = [
#       "secret_string"
#     ]
#   }
#   secret_id     = "${aws_secretsmanager_secret.tenant-management.id}"
#   secret_string = <<EOF
# {
#   "username": "${var.mysql_username}",
#   "engine": "mysql",
#   "host": "${aws_rds_cluster.tenant-management.endpoint}",
#   "password": "${var.mysql_password}",
#   "port": ${aws_rds_cluster.tenant-management.port},
#   "dbInstanceIdentifier": "${aws_rds_cluster.tenant-management.cluster_identifier}"
# }
# EOF
# }

# output "endpoint" {
#   value = aws_rds_cluster.tenant-management.endpoint
# }
