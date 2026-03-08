# Creates a variable that will be referenced through the code, with a number value 
# (prompts the user or can be set as TF_VAR_character_length)
variable "character_length" {
  type        = number
  description = "Character length desired to generate the random string/password"
  # default = 16
}