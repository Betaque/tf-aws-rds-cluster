data "aws_iam_policy" "rds_monitoring_policy" {
  name = "AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy" "rds_service_role_policy" {
  name = "AmazonRDSServiceRolePolicy"
}
