

resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = "test_trigger"
  description = "Trigger Lambda every 10 minutes"
  
  schedule_expression = "cron(0/2 * * * ? *)"
}


resource "aws_cloudwatch_event_target" "event_target" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  target_id = "lambda_target"
  arn       = aws_lambda_function.test_lambda.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_test_lambda" {
  statement_id  = "AllowExecutionFromCloudWatcheve"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
