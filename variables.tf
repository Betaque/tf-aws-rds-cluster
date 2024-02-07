variable "aws_rds_subnet_group_name" {
  description = "Name of the subnet group name."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
}

variable "db_subnet_group_tag_name" {
  description = "Tag of the subnet group."
  type        = string
}

variable "is_primary_cluster" {
  description = "Determines whether cluster is primary cluster with writer instance (set to `false` for global cluster and replica clusters)"
  type        = bool
}

variable "rds_cluster_name" {
  description = "Name of the RDS Cluster."
  type        = string
}

variable "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
}
variable "rds_cluster_engine" {
  description = "The name of the database engine to be used for this DB cluster."
  type        = string
}

variable "rds_cluster_engine_version" {
  description = "The database engine version."
  type        = string
}

variable "global_cluster_id" {
  description = "The global cluster identifier specified on `aws_rds_global_cluster`"
  type        = string
}

variable "rds_cluster_backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
}

variable "rds_cluster_master_username" {
  description = "Username for the master DB user. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database"
  type        = string
}

variable "rds_cluster_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database"
  type        = string
}

variable "rds_cluster_port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "rds_cluster_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to `true`. The default is `false`"
  type        = bool
}

variable "rds_cluster_preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled using the `backup_retention_period` parameter. Time in UTC"
  type        = string
}

variable "rds_cluster_preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in (UTC)"
  type        = string
}

variable "rds_cluster_skip_final_snapshot" {
  description = "Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created"
  type        = bool
}

variable "rds_cluster_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is `true`"
  type        = bool
}

variable "rds_cluster_parameter_group_name" {
  description = "The name of the cluster parameter group"
  type        = string
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
}

variable "rds_cluster_family" {
  description = "The family of the DB cluster parameter group"
  type        = string
}

variable "rds_cluster_instance_count" {
  description = "count of instance in cluster"
  type        = number
}

variable "rds_cluster_instance_name" {
  description = "Name of cluster instances"
  type        = string
}

variable "rds_cluster_instance_class" {
  description = "Instance type to use at master instance. Note: if `autoscaling_enabled` is `true`, this will be the same instance class used on instances created by autoscaling"
  type        = string
}

variable "rds_cluster_instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default `true`"
  type        = bool
}

variable "rds_cluster_instance_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances."
  type        = number
}

variable "rds_cluster_instance_publicly_accessible" {
  description = "Determines whether instances are publicly accessible. Default `false`"
  type        = bool
}

variable "rds_cluster_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not"
  type        = bool
}

variable "rds_cluster_instance_performance_insights_retention_period" {
  description = "Amount of time in days to retain Performance Insights data."
  type        = number
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "rds_security_group_name" {
  description = "Name of security group for RDS."
  type        = string
}

variable "rds_security_group_tag_name" {
  description = "Tag of security group for RDS."
  type        = string
}

variable "rds_ingress_rules" {
  description = "Ingress rules of security group for RDS."
  type        = list(any)
}

variable "rds_ingress_cidr_blocks" {
  description = "Ingress CIDR Blocks of security group for RDS."
  type        = list(any)
}

variable "rds_ingress_rules_from_port" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(any)
}

variable "rds_ingress_rules_to_port" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(any)
}

variable "rds_ingress_rules_protocols" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(any)
}

variable "rds_egress_rules" {
  description = "Egress rules of security group for RDS."
  type        = list(any)
}

variable "rds_egress_cidr_blocks" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(any)
}

variable "rds_egress_rules_from_port" {
  description = "Egress rules from port of security group for RDS."
  type        = list(any)
}

variable "rds_egress_rules_to_port" {
  description = "Egress rules to port of security group for RDS."
  type        = list(any)
}

variable "rds_egress_rules_protocols" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(any)
}

variable "ingress_rule_database_port" {
  description = "Ingress rule port for RDS cluster."
  type        = number
}

variable "ingress_rule_port_protocol" {
  description = "Ingress rule protocol for RDS cluster."
  type        = string
}

########################################################
# Cluster Instance Autoscaling Variables
########################################################

variable "rds_instance_min_capacity" {
  description = "Minimum number of read replicas permitted when autoscaling is enabled"
  type        = number
}

variable "rds_instance_max_capacity" {
  description = "Maximum number of read replicas permitted when autoscaling is enabled"
  type        = number
}

variable "rds_appautoscaling_policy_name" {
  description = "Autoscaling policy name"
  type        = string
}

variable "rds_appautoscaling_metric_type" {
  description = "The metric type to scale on. Valid values are `RDSReaderAverageCPUUtilization` and `RDSReaderAverageDatabaseConnections`"
  type        = string
}

variable "rds_appautoscaling_target_value" {
  description = "CPU threshold which will initiate autoscaling"
  type        = number
}
