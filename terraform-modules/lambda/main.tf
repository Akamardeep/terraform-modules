variable "function-name" {
    description = "name of lambda function"
  
}

variable "source-file" {
    description = "name of lambda function"
  
}
data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.source-file
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda.zip"
  function_name = var.function-name
  role          = aws_iam_role.test01_role.arn
  handler       = "lambda.lambda_handler"
  

  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.12"
  

  environment {
    variables = {
      DESTINATION_BUCKET = "testbucket-0061212"
      GROUP_NAME         = "/aws/lambda/aws-sqs-dev-jobsWorker"
      PREFIX            = "logs"
    }
  }
}
resource "aws_iam_role" "test01_role" {
  name = "test01"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

