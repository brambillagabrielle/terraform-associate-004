# Displays the string generated in the console after applying
output "random_string_value" {
  value = random_string.generated_string.id
}

# Doesn't display the password generated in the console, since is sensitive information
output "random_password_value" {
  value = random_password.generated_password.id
}