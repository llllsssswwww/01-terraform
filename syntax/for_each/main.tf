provider "aws" {
  region = "ap-northeast-2"
}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default    = ["aws01-neo", "aws01-morpheous" ]
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name = each.value
}

output "all_user" {
  value = values(aws_iam_user.example)[0].arn
}
