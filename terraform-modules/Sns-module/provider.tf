provider "aws" {
    region = "us-east-1"
  
}

# resource "aws_sns_topic_subscription" "user_updates" {
#   topic_arn = aws_sns_topic.user_updates.arn
#   protocol  = "email"
#   endpoint  = "akamardeep1691@gmail.com"
# }