# RDS Cluster Module

This module creates a RDS Cluster in AWS with customizable configurations.

## Usage

1. **Get Started:** Begin by creating the necessary files, provider.tf and main.tf, in your Terraform project directory.
2. **Declare Provider:** Open provider.tf and declare the AWS provider. Ensure you've configured your AWS credentials and set the desired region.
```
provider "aws" {
  region = "us-east-1" // Set your AWS region
}
```
3. **Add RDS Module and Define Variables:** Incorporate the RDS Module into your main.tf file, and set values for the variables defined in variables.tf.

For Example:-
```
module "rds_cluster" {
  source                                                 = "git::https://github.com/Betaque/tf-aws-rds-cluster.git//?ref=feat/generic-rds" # Path of the Module
  db_subnet_group_name                                   = "db-subnet-group-east1"
  subnet_ids                                             = module.vpc_module.public_subnet_id
  db_subnet_group_tag_name                               = "RDS MySQL DB subnet group"
  is_primary_cluster                                     = true
  cluster_name                                           = "db-cluster-1"
  cluster_database_name                                  = "testdb"
  cluster_engine                                         = "aurora-mysql"
  cluster_engine_version                                 = "5.7.mysql_aurora.2.07.9"
  cluster_backup_retention_period                        = 1
  cluster_master_username                                = "admin"
  cluster_master_password                                = "somepass123"
  cluster_port                                           = 3306
  cluster_deletion_protection                            = false
  cluster_preferred_backup_window                        = "06:19-06:49"
  cluster_preferred_maintenance_window                   = "sun:09:58-sun:10:28"
  cluster_skip_final_snapshot                            = true
  cluster_storage_encrypted                              = true
  cluster_parameter_group_name                           = "try-aurora-mysql5-7"
  db_parameter_group_name                                = "try-aurora-mysql5-7"
  cluster_family                                         = "aurora-mysql5.7"
  cluster_instance_count                                 = 2
  cluster_instance_name                                  = "db-cluster-1-instance"
  cluster_instance_class                                 = "db.r5.large"
  cluster_instance_auto_minor_version_upgrade            = true
  cluster_instance_monitoring_interval                   = 60
  cluster_instance_publicly_accessible                   = false
  cluster_instance_performance_insights_enabled          = true
  cluster_instance_performance_insights_retention_period = 7
  vpc_id                                                 = module.vpc_module.vpc_id             # VPC Id
  rds_security_group_name                                = "aurora-sg-east1"
  rds_security_group_tag_name                            = "rds test security group"
  rds_ingress_rules                                      = [3306]
  rds_ingress_cidr_blocks                                = ["10.0.0.0/16"]
  rds_ingress_rules_from_port                            = [3306]
  rds_ingress_rules_to_port                              = [3306]
  rds_ingress_rules_protocols                            = ["tcp"]
  rds_egress_rules                                       = [0]
  rds_egress_cidr_blocks                                 = ["0.0.0.0/0"]
  rds_egress_rules_from_port                             = [0]
  rds_egress_rules_to_port                               = [0]
  rds_egress_rules_protocols                             = ["-1"]
  ingress_rule_database_port                             = 3306
  ingress_rule_port_protocol                             = "tcp"
  rds_instance_min_capacity                              = 1
  rds_instance_max_capacity                              = 15
  appautoscaling_policy_name                             = "cpu-auto-scaling"
  appautoscaling_metric_type                             = "RDSReaderAverageCPUUtilization"
  appautoscaling_target_value                            = 75
}
```

4. **Initialize Terraform:** Run the below terraform Command to initialize the project and download the module dependencies.
```
terraform init
```

5. **Apply Changes:** Execute the below terraform Command to create the VPC infrastructure based on the specified configurations.
```
terraform apply
``` 
