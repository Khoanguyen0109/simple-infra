data "aws_secretsmanager_secret" "secrets" {
  arn = "arn:aws:secretsmanager:${var.aws_region}:${data.aws_caller_identity.current.account_id}:secret:${var.secret_key}"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

locals {
  dns_config = jsondecode(data.aws_secretsmanager_secret_version.dns_config.secret_string)
}
