# Generate a random string with an specific number of alphanumeric and special characters
resource "random_string" "generated_string" {
  length = var.character_length
}

# Same as the previous block, but this value will be treated as sensitive information (password)
resource "random_password" "generated_password" {
  length = var.character_length
}