resource "aws_sns_topic_subscription" "user_updates" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = var.subscription_protocol
  endpoint  = var.subscription_endpoint
}