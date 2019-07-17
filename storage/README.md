# GOAL

- Learn about storage

## Steps

### Setup infrastructure

create `/infrastructure` with Terraform to setup the infrastructure with a Aurora Servleress

#### Enable Data API

https://s3-us-west-2.amazonaws.com/rds-data-preview/Amazon+Aurora+Serverless+Data+API_Preview-05-01.pdf
https://medium.com/@cmani/look-ma-no-database-connection-pools-67efb87e108
https://github.com/giuseppeborgese/terraform-aws-secret-manager-with-rotation/blob/master/main.tf

https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/query-editor.html
https://www.w3schools.com/sql/sql_datatypes.asp
https://dev.mysql.com/doc/refman/8.0/en/create-table.html
https://s3-us-west-2.amazonaws.com/rds-data-preview/Amazon+Aurora+Serverless+Data+API_Preview-05-01.pdf
https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/RDSDataService.html#executeStatement-property
https://aws.amazon.com/blogs/aws/new-data-api-for-amazon-aurora-serverless/


### Setup a sample serverless api 

Create a simple servleress api that create a entry in the data base
seperate business logic from adapters (infrastructure adapter for db).

## Source

- https://www.davidbegin.com/building-a-mysql-da/
- https://github.com/karakaram/terraform-aws-aurora-serverless
- https://medium.com/mos-engineering/serverless-rdbs-part-1-set-up-aws-rds-aurora-and-lambda-with-serverless-4c2a5146faf4
- https://read.acloud.guru/getting-started-with-the-amazon-aurora-serverless-data-api-6b84e466b109


- https://ndench.github.io/terraform/terraform-destroy-rds
- https://learn.hashicorp.com/terraform/getting-started/dependencies.html
- ! https://medium.com/@devopslearning/100-days-of-devops-day-21-mysql-rds-database-creation-using-terraform-278eeaff339f
- https://medium.com/mos-engineering/serverless-rdbs-part-1-set-up-aws-rds-aurora-and-lambda-with-serverless-4c2a5146faf4
- https://nickcharlton.net/posts/terraform-aws-vpc.html
- https://lobster1234.github.io/2019/04/22/serverless-aurora-rds/
- https://medium.com/@mudrii/amazon-aws-eks-and-rds-postgresql-with-terraform-b94d6cf1be38
- https://www.davidbegin.com/building-a-mysql-da/
- https://github.com/karakaram/terraform-aws-aurora-serverless/blob/master/main.tf