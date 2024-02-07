data "aws_iam_role" "rds_service_test_role" {
  name = "AWSServiceRoleForRDS"
}


resource "aws_iam_role" "rds_monitoring_role" {
  name                  = "rdsMonitoringRole"
  description           = "Allows access to RDS service resources that are required to fetch logs and metrics by Cloudwatch."
  path                  = "/"
  assume_role_policy    = file("${path.module}/rds_monitoring_role.json")
  force_detach_policies = false
  managed_policy_arns   = [data.aws_iam_policy.rds_monitoring_policy.arn]
}
