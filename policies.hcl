policy "require-dev-environment" {
  query             = "data.terraform.environment.deny"
  enforcement_level = "mandatory"
  description       = "Require terraform_data resources to use the dev environment."
}
