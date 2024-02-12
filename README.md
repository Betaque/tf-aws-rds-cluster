# RDS Cluster Module

This module creates a RDS Cluster in AWS with customizable configurations.

### Prerequisites
- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### AWS Authentication 
This guide outlines the process of authenticating with AWS using Terraform through Access Key and Secret Key.

**Generate Access Key and Secret Key:**
1. Log in to your AWS Management Console.
2. Go to the IAM service.
3. Navigate to the Users section and select the user for whom you want to generate the access key and secret key.
4. Under the Security credentials tab, click on Create access key.
5. Make sure to save the access key ID and secret access key. These will be used for authentication.

### Module Configurations:
 
**1. Create a new Terraform configuration file (e.g., provider.tf) or use an existing one.**

**2. Add the following code to configure AWS provider with access key and secret key:**

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"  # Replace with your desired AWS region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
Replace **YOUR_ACCESS_KEY** and **YOUR_SECRET_KEY** with the access key ID and secret access key generated in the previous step.

or you can export your access_key and secret_key on your local machine.
```
export access_key="YOUR_ACCESS_KEY"
export secret_key="YOUR_SECRET_KEY"
```

**3. Add RDS Cluster Module and Define Variables:**


Add the RDS Cluster Module to your main.tf file and fill in the variables in variables.tf with the values you need. Just replace the example values with your own settings.

**For Example:-**

```
module "rds_cluster" {

  source                                                     = "git::https://github.com/Betaque/tf-aws-rds-cluster.git//?ref=feat/generic-rds"
  aws_rds_subnet_group_name                                  = "db-subnet-group-east1"
  subnet_ids                                                 = ["<YOUR_SUBNET_ID_1>", "<YOUR_SUBNET_ID_2>"] #List of subnet IDs where the RDS Cluster will be launched,  You can also provide a single subnet ID.
  db_subnet_group_tag_name                                   = "RDS MySQL DB subnet group"
  is_primary_cluster                                         = true
  rds_cluster_name                                           = "db-cluster-1"
  rds_cluster_database_name                                  = "testdb"
  rds_cluster_engine                                         = "aurora-mysql"
  rds_cluster_engine_version                                 = "5.7.mysql_aurora.2.07.9"
  rds_cluster_backup_retention_period                        = 1
  rds_cluster_master_username                                = "admin"
  rds_cluster_master_password                                = "somepass123"
  rds_cluster_port                                           = 3306
  rds_cluster_deletion_protection                            = false
  rds_cluster_preferred_backup_window                        = "06:19-06:49"
  rds_cluster_preferred_maintenance_window                   = "sun:09:58-sun:10:28"
  rds_cluster_skip_final_snapshot                            = true
  rds_cluster_storage_encrypted                              = true
  rds_cluster_parameter_group_name                           = "try-aurora-mysql5-7"
  rds_cluster_family                                         = "aurora-mysql5.7"
  rds_cluster_instance_count                                 = 2
  rds_cluster_instance_name                                  = "db-cluster-1-instance"
  rds_cluster_instance_class                                 = "db.r5.large"
  rds_cluster_instance_auto_minor_version_upgrade            = true
  rds_cluster_instance_monitoring_interval                   = 60
  rds_cluster_instance_publicly_accessible                   = false
  rds_cluster_instance_performance_insights_enabled          = true
  rds_cluster_instance_performance_insights_retention_period = 7
  vpc_id                                                     = <YOUR_VPC_ID>
  rds_security_group_name                                    = "aurora-sg-east1"
  rds_security_group_tag_name                                = "rds test security group"
  rds_ingress_rules                                          = [3306]
  rds_ingress_cidr_blocks                                    = ["10.0.0.0/16"]
  rds_ingress_rules_from_port                                = [3306]
  rds_ingress_rules_to_port                                  = [3306]
  rds_ingress_rules_protocols                                = ["tcp"]
  rds_egress_rules                                           = [0]
  rds_egress_cidr_blocks                                     = ["0.0.0.0/0"]
  rds_egress_rules_from_port                                 = [0]
  rds_egress_rules_to_port                                   = [0]
  rds_egress_rules_protocols                                 = ["-1"]
  ingress_rule_database_port                                 = 3306
  ingress_rule_port_protocol                                 = "tcp"
  rds_instance_min_capacity                                  = 1
  rds_instance_max_capacity                                  = 15
  rds_appautoscaling_policy_name                             = "cpu-auto-scaling"
  rds_appautoscaling_metric_type                             = "RDSReaderAverageCPUUtilization"
  rds_appautoscaling_target_value                            = 75
  db_parameter_group_name   = "test"
  global_cluster_id = "test-global"
}
```

**4. Initialize Terraform:** 

Open a terminal and navigate to the directory containing your Terraform configuration file.

Run the following command to initialize Terraform:
```
terraform init
```

**5. Apply Terraform Configuration:** 

After initializing, you can now apply the Terraform configuration to authenticate with AWS:
```
terraform apply
``` 
