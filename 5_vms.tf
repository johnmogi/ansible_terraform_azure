# Create a random password to access machine
resource "random_password" "fe_password" {
  length           = 12
  special          = true
  override_special = "#$%&*()-_=+[]{}<>:?"
}

#  password          = random_password.fe_password.result