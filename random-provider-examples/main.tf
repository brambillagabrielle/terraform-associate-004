# Doc: https://registry.terraform.io/providers/hashicorp/random/latest/docs
provider "random" {}

# Generate a random string with 16 alphanumeric and special characters
resource "random_string" "generated_string" {
  length = 16
}

# Same as the previous block, but this value will be treated as sensitive information (password)
resource "random_password" "generated_password" {
  length = 16
}

# Displays the string generated in the console after applying
output "random_string_value" {
  value = random_string.generated_string.id
}

# Doesn't display the password generated in the console, since is sensitive information
output "random_password_value" {
  value = random_password.generated_password.id
}