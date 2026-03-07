# Doc: https://registry.terraform.io/providers/hashicorp/random/latest/docs
provider "random" {}

# Creates a variable that will be referenced through the code, with a number value 
# (prompts the user or can be set as TF_VAR_character_length)
variable "character_length" {
  type = number
  description = "Character length desired to generate the random string/password"
  # default = 16
}

# Generate a random string with an specific number of alphanumeric and special characters
resource "random_string" "generated_string" {
  length = var.character_length
}

# Same as the previous block, but this value will be treated as sensitive information (password)
resource "random_password" "generated_password" {
  length = var.character_length
}

# Displays the string generated in the console after applying
output "random_string_value" {
  value = random_string.generated_string.id
}

# Doesn't display the password generated in the console, since is sensitive information
output "random_password_value" {
  value = random_password.generated_password.id
}