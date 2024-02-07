resource "aws_appautoscaling_target" "aws_rds_autoscalling" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.cluster.id}"
  min_capacity       = var.rds_instance_min_capacity
  max_capacity       = var.rds_instance_max_capacity
}

resource "aws_appautoscaling_policy" "aws_rds_autoscalling_policy" {
  name               = var.rds_appautoscaling_policy_name
  service_namespace  = aws_appautoscaling_target.aws_rds_autoscalling.service_namespace
  scalable_dimension = aws_appautoscaling_target.aws_rds_autoscalling.scalable_dimension
  resource_id        = aws_appautoscaling_target.aws_rds_autoscalling.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.rds_appautoscaling_metric_type
    }

    target_value       = var.rds_appautoscaling_target_value
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
