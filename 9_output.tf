output "admin_password" {
    value = random_password.fe_password.result
}