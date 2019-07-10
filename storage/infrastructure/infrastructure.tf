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
  master_password      = "${var.db_password}"
  master_username      = "${var.db_user}"
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
