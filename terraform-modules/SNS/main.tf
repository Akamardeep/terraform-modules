# sns_module/main.tf

variable "topic_arn" {
  description = "The name of the SNS topic"
}

variable "topic_name" {
  description = "The name of the SNS topic"
}

variable "subscription_protocol" {
  description = "The subscription protocol (e.g., email)"
}

variable "subscription_endpoint" {
  description = "The endpoint for the subscription (e.g., email address)"
}

resource "aws_sns_topic" "user_updates" {
  name            = var.topic_name
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}


