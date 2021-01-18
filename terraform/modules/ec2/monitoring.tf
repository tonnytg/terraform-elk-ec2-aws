resource "aws_cloudwatch_metric_alarm" "asg_cpu" {
    alarm_name                = "cpu-utilization"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = "2"
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/EC2"
    period                    = "120" #seconds
    statistic                 = "Average"
    threshold                 = "80"
    alarm_description         = "This metric monitors ec2 cpu utilization"
    alarm_actions             = var.sns_topic_list
    dimensions = {
        AutoScalingGroupName  = aws_autoscaling_group.ec2_asg.name
    }
}