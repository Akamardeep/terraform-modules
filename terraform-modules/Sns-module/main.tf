module "user_updates" {
  source  = "../SNS"
 topic_name="amardeep"
 topic_arn = "module.user_updates.arn"
subscription_protocol="email"
subscription_endpoint="akamardeep1691@gmail.com"

}